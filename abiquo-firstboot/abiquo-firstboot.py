#!/usr/bin/python

from snack import *
import sys,os
import socket
import signal
import commands
import subprocess
import ConfigParser
import json
import codecs
import shutil
import logging
import re

def signal_handler(signal, frame):
    logging.info('You pressed Ctrl+C!')
    sys.exit(0)

def detect_public_ip():
    try:
        # Warning: Not working in all linuxes.
        ip = commands.getoutput("/sbin/ifconfig").split("\n")[1].split()[1][5:]
        s = socket.inet_aton(ip)
        return ip
    except socket.error:
        return False

class NfsWindow:
    def __init__(self,screen):
        self.conf_path = "/opt/abiquo/config/abiquo.properties"
        self.fstab_path = "/etc/fstab"
        self.mtab_path = "/etc/mtab"
        self.repository_path = "/opt/vm_repository"
        self.defaulturl = "<nfs-ip>:/opt/vm_repository"
        self.screen = screen
        self.label = Label('NFS repository:')
        self.entry = Entry(33,self.defaulturl)
        self.text = TextboxReflowed(50,"Enter your NFS repository URL.\n")
        self.topgrid = GridForm(self.screen, "NFS Repository", 1, 3)
        self.topgrid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid = Grid(2, 1)
        self.grid.setField (self.label, 0, 0, (0, 0, 1, 0), anchorLeft = 1)
        self.grid.setField (self.entry, 1, 0)
        self.topgrid.add (self.grid, 0, 1, (0, 0, 0, 1))
        self.bb = ButtonBar (self.screen, ["OK","Cancel"],compact=1)
        self.topgrid.add (self.bb, 0, 2, growx = 1)

    def run(self):
        # Exit if vm_repository exists in mtab
        if self.check_mount():
            return -1
        self.topgrid.setCurrent(self.entry)
        result = self.topgrid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "cancel":
            return -1
        if not self.check_nfs_url(self.entry.value()):
            self.screen.popWindow()
            self.defaulturl = self.entry.value()
            ButtonChoiceWindow(self.screen,"URL incorrect","Please enter a URL with the form:\n <ip>:<mountpoint>",buttons = ["OK"], width = 50)
        elif not self.mount_nfs(self.entry.value()):
            self.screen.popWindow()
            self.defaulturl = self.entry.value()
            ButtonChoiceWindow(self.screen,"Can't mount","Mountpoint not valid or access denied.",buttons = ["OK"], width = 50)
        else:
            self.defaulturl = self.entry.value()
            self.set_nfs_url(self.defaulturl)
            return 0

    def set_nfs_url(self,url):
        config = ConfigParser.ConfigParser()
        config.optionxform = str
        if os.path.exists(self.fstab_path):
            with open(self.fstab_path,"r+a") as f:
                for line in f:
                    if self.repository_path in line:
                        return False
                f.write(url+'  '+self.repository_path+' nfs    defaults        0 0\n')
        if os.path.exists(self.conf_path):
            try:
                config.readfp(open(self.conf_path))
                config.set('remote-services', 'abiquo.appliancemanager.repositoryLocation', url)
                config.write(open(self.conf_path,'wa'))
            except Exception:
                logging.error('Cannot set repository path.')


    def check_mount(self):
        if os.path.exists(self.mtab_path):
            with open(self.mtab_path,"rt") as f:
                for line in f:
                    if self.repository_path in line:
                        return True
        return False

    def mount_nfs(self,url):
        try:
            # Mount with 4 seconds of timeout, redirecting output to null
            p = subprocess.call('timeout 4 mount '+url+' '+self.repository_path, shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            if p != 0:
                return False
        except Exception:
            logging.error('Cannot mount '+url+' repository')
            return False
        return True

    def check_nfs_url(self,url):
        if ":/" in url:
            try:
                s = socket.inet_aton(url.split(":/")[0])
                return True
            except socket.error:
                pass
        return False

class ApiWindow:
    def __init__(self,screen,profiles):
        self.conf_path = '/var/www/html/ui/config/client-config.json'
        ip = detect_public_ip()
        if ip and not 'abiquo-ui' in profiles:
            self.defaulturl = 'http://'+ip+'/api'
            # Dont't detect IP if it's a Standalone Client.
        else:
            self.defaulturl = "http://<endpoint-ip>/api"
        self.screen = screen
        self.label = Label('API endpoint:')
        self.entry = Entry(33,self.defaulturl)
        self.text = TextboxReflowed(50,"Enter API endpoint.\nThis URL should be reachable by the client browser.\n")
        self.topgrid = GridForm(self.screen, "API endpoint", 1, 3)
        self.topgrid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid = Grid(2, 1)
        self.grid.setField (self.label, 0, 0, (0, 0, 1, 0), anchorLeft = 1)
        self.grid.setField (self.entry, 1, 0)
        self.topgrid.add (self.grid, 0, 1, (0, 0, 0, 1))
        self.bb = ButtonBar (self.screen, ["OK","Cancel"],compact=1)
        self.topgrid.add (self.bb, 0, 2, growx = 1)

    def run(self):
        self.topgrid.setCurrent(self.entry)
        result = self.topgrid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "cancel":
            return -1
        if not self.check_api_url(self.entry.value()):
            self.screen.popWindow()
            ButtonChoiceWindow(self.screen,"URL incorrect","Please enter a URL with the form:\n http://<endpoint-ip>/api",buttons = ["OK"], width = 50)
        else:
            self.defaulturl = self.entry.value()
            self.set_api_url(self.entry.value())
            return 0

    def set_api_url(self,url):
        if os.path.exists(self.conf_path):
            try:
                with codecs.open(self.conf_path,'r','utf-8') as f:
                    data = json.load(f)
                    data['config.endpoint'] = url
                    dump = json.dumps(data,indent=4,ensure_ascii=False)
                    with open(self.conf_path,'w') as out:
                        print >> out, dump.encode('utf-8')
            except Exception:
                return False

    def check_api_url(self, url):
        if "http://" in url:
            try:
                s = socket.inet_aton(url.split("http://")[1].split("/")[0])
                return True
            except socket.error:
                pass
        elif "https://" in url:
            try:
                s = socket.inet_aton(url.split("https://")[1].split("/")[0])
                return True
            except socket.error:
                pass
        return False

class DCWindow:
    def __init__(self,screen):
        self.defaultdc = "Abiquo"
        self.screen = screen
        self.label = Label('Datacenter name:')
        self.entry = Entry(33,self.defaultdc)
        self.text = TextboxReflowed(50,"Enter Datacenter ID for your set of remote services.\n")
        self.topgrid = GridForm(self.screen, "Datacenter name", 1, 3)
        self.topgrid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid = Grid(2, 1)
        self.grid.setField (self.label, 0, 0, (0, 0, 1, 0), anchorLeft = 1)
        self.grid.setField (self.entry, 1, 0)
        self.topgrid.add (self.grid, 0, 1, (0, 0, 0, 1))
        self.bb = ButtonBar (self.screen, ["OK","Cancel"],compact=1)
        self.topgrid.add (self.bb, 0, 2, growx = 1)

    def run(self):
        self.topgrid.setCurrent(self.entry)
        result = self.topgrid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "cancel":
            return -1
        else:
            self.defaultdc = self.entry.value()
            self.set_dc_id(self.entry.value())
            return 0

    def set_dc_id(self, dcid):
        config = ConfigParser.ConfigParser()
        config.optionxform = str
        conf_path = '/opt/abiquo/config/abiquo.properties'
        if os.path.exists(conf_path):
            try:
                config.readfp(open(conf_path))
                config.set('remote-services', 'abiquo.datacenter.id', dcid)
                config.write(open(conf_path,'wa'))
            except Exception:
                logging.error('Cannot set datacenter id')

class ServerWindow:
    def __init__(self,screen):
        self.ip = "<server-ip>"
        self.screen = screen
        self.label = Label('Abiquo Server IP')
        self.entry = Entry(33,self.ip)
        self.text = TextboxReflowed(50,"Enter IP address of Abiquo server:\n")
        self.topgrid = GridForm(self.screen, "Server IP:", 1, 3)
        self.topgrid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid = Grid(2, 1)
        self.grid.setField (self.label, 0, 0, (0, 0, 1, 0), anchorLeft = 1)
        self.grid.setField (self.entry, 1, 0)
        self.topgrid.add (self.grid, 0, 1, (0, 0, 0, 1))
        self.bb = ButtonBar (self.screen, ["OK","Cancel"],compact=1)
        self.topgrid.add (self.bb, 0, 2, growx = 1)
    def run(self):
        self.topgrid.setCurrent(self.entry)
        result = self.topgrid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "cancel":
            return -1
        elif not self.check_ip(self.entry.value()):
            self.screen.popWindow()
            self.ip = self.entry.value()
            ButtonChoiceWindow(self.screen,"IP error","IP address not valid.",buttons = ["OK"], width = 50)

        else:
            self.ip = self.entry.value()
            self.set_server_ip()
            return 0

    def set_server_ip(self):
        config = ConfigParser.ConfigParser()
        config.optionxform = str
        conf_path = '/opt/abiquo/config/abiquo.properties'
        if os.path.exists(conf_path):
            try:
                config.readfp(open(conf_path))
                config.set('remote-services', 'abiquo.server.api.location', 'http://'+self.ip+':8009/api')
                config.set('remote-services', 'abiquo.rabbitmq.host', self.ip)
                config.write(open(conf_path,'wa'))
            except Exception:
                logging.error('Cannot set Server ip')

    def check_ip(self,ip):
        try:
            s = socket.inet_aton(ip)
            return True
        except socket.error:
            pass
        return False

class HTTPSWindow:
    def __init__(self,screen):
        self.screen = screen
        self.text = TextboxReflowed(50,"Do you want to enable secure SSL front-end?\n")
        self.grid = GridForm(self.screen, "Enable HTTPS", 1, 2)
        self.bb = ButtonBar(self.screen, ["No","Yes"],compact=1)
        self.grid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid.add(self.bb,0,1,growx = 1)       
        self.abiquo_conf = '/etc/httpd/conf.d/abiquo.conf'
        self.ssl_conf = '/etc/httpd/conf.d/ssl.conf'
        self.ssl_conf_example = '/usr/share/doc/abiquo-ui/ssl.conf'
        self.abiquo_ssl_conf = '/etc/httpd/conf.d/abiquo_ssl.conf'
        self.abiquo_ssl_conf_example = '/usr/share/doc/abiquo-ui/abiquo_ssl.conf'
        self.abiquo_generate_certs = '/usr/share/doc/abiquo-ui/create_certs.sh'
        self.tomcat_server_conf = '/opt/abiquo/tomcat/conf/server.xml'
        self.tomcat_server_ssl_conf_example = '/usr/share/doc/abiquo-core/examples/tomcat/server_ssl.xml'
        self.ui_conf_path = '/var/www/html/ui/config/client-config.json'

    def run(self):
        result = self.grid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "no":
            return 0
        else:
            # Generate certs and set HTTPS in apache
            self.set_https()
            return 0

    def set_https(self):
        # save backups and copy configuration from examples.
        if os.path.exists(self.abiquo_conf):
            shutil.move(self.abiquo_conf,self.abiquo_conf+'.backup')
        if os.path.exists(self.tomcat_server_conf):
            shutil.move(self.tomcat_server_conf,self.tomcat_server_conf+'.backup')
        if os.path.exists(self.abiquo_ssl_conf_example):
            shutil.copy2(self.abiquo_ssl_conf_example,self.abiquo_ssl_conf)
        else:
            logging.warning("abiquo_ssl.conf missing")
        if os.path.exists(self.tomcat_server_ssl_conf_example):
            shutil.copy2(self.tomcat_server_ssl_conf_example,self.tomcat_server_conf)
        else:
            logging.warning("server.xml missing")
        if os.path.exists(self.ssl_conf_example):
            shutil.copy2(self.ssl_conf_example,self.ssl_conf)
        else:
            logging.warning("abiquo.conf missing")
        try:
            # call script and redirect output to null
            p = subprocess.call(self.abiquo_generate_certs, shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
        except Exception:
            logging.error("Cannot generate SSL certs")
        # Change client json http -> https
        if os.path.exists(self.ui_conf_path):
            shutil.copy2(self.ui_conf_path,self.ui_conf_path+'.backup')
            try:
                with open(self.ui_conf_path, "rt") as conf:
                    lines = conf.readlines()
                with open(self.ui_conf_path, "wb") as out:
                    for line in lines:
                        out.write(re.sub(r'http:','https:',line))
            except Exception:
                logging.warning("Failed setting https in "+self.ui_conf_path+" :\n"+str(err))
        else:
            logging.warning("UI config not found")


class mainWindow:
    def __init__(self):
        logging.basicConfig(filename='/var/log/abiquo-firstboot.log',level=logging.DEBUG,format='%(asctime)s - %(levelname)s: %(message)s')
        # profiles from /etc/abiquo-installer
        profiles = ""
        if os.path.exists("/etc/abiquo-installer"):
            try:
                profiles = eval(open("/etc/abiquo-installer", "r").readline().split(": ")[1])
            except:
                logging.error("Cannot read profiles.")
                exit(1)
        else:
            screen.finish()
            logging.error("No abiquo profiles detected.")
            exit(1)

        screen = SnackScreen()


        #  Abiquo colors theme
        screen.setColor('ROOT','yellow','black')
        screen.setColor('SHADOW','black','black')
        screen.setColor('TITLE','black','white')
        screen.setColor('ENTRY','black','yellow')
        screen.setColor('LABEL','black','white')
        screen.setColor('WINDOW','black','white')
        screen.setColor('BUTTON','yellow','black')
        screen.setColor('ACTBUTTON','yellow','black')
        screen.setColor('HELPLINE','yellow','black')
        screen.setColor('ROOTTEXT','yellow','black')
        """ Reference:
        colorsets = { "ROOT" : _snack.COLORSET_ROOT,
              "BORDER" : _snack.COLORSET_BORDER,
              "WINDOW" : _snack.COLORSET_WINDOW,
              "SHADOW" : _snack.COLORSET_SHADOW,
              "TITLE" : _snack.COLORSET_TITLE,
              "BUTTON" : _snack.COLORSET_BUTTON,
              "ACTBUTTON" : _snack.COLORSET_ACTBUTTON,
              "CHECKBOX" : _snack.COLORSET_CHECKBOX,
              "ACTCHECKBOX" : _snack.COLORSET_ACTCHECKBOX,
              "ENTRY" : _snack.COLORSET_ENTRY,
              "LABEL" : _snack.COLORSET_LABEL,
              "LISTBOX" : _snack.COLORSET_LISTBOX,
              "ACTLISTBOX" : _snack.COLORSET_ACTLISTBOX,
              "TEXTBOX" : _snack.COLORSET_TEXTBOX,
              "ACTTEXTBOX" : _snack.COLORSET_ACTTEXTBOX,
              "HELPLINE" : _snack.COLORSET_HELPLINE,
              "ROOTTEXT" : _snack.COLORSET_ROOTTEXT,
              "EMPTYSCALE" : _snack.COLORSET_EMPTYSCALE,
              "FULLSCALE" : _snack.COLORSET_FULLSCALE,
              "DISENTRY" : _snack.COLORSET_DISENTRY,
              "COMPACTBUTTON" : _snack.COLORSET_COMPACTBUTTON,
              "ACTSELLISTBOX" : _snack.COLORSET_ACTSELLISTBOX,
              "SELLISTBOX" : _snack.COLORSET_SELLISTBOX }  """


        # Title
        if os.path.exists("/etc/system-release"):
            release = open("/etc/system-release", "r").readline()
            screen.drawRootText(0, 0, release)

        # NFS Repository window
        DONE = 0
        if any(p in profiles for p in ['abiquo-monolithic','abiquo-kvm','abiquo-remote-services','abiquo-v2v']) \
            and not 'abiquo-nfs-repository' in profiles:
            while not DONE:
                self.win = NfsWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        # Datacenter ID (Server, V2V, Public Cloud, )
        if any(p in profiles for p in ['abiquo-v2v','abiquo-server','abiquo-remote-services','abiquo-public-cloud']):
            while not DONE:
                self.win = DCWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        # Server IP for Remote Services 
        if any(p in profiles for p in ['abiquo-remote-services','abiquo-v2v']) \
            and 'abiquo-distributed' in profiles:
            while not DONE:
                self.win = ServerWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        # API endpoint and SSL
        if any(p in profiles for p in ['abiquo-ui','abiquo-monolithic','abiquo-server']):
            while not DONE:
                self.win = ApiWindow(screen,profiles)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
            DONE = 0
            while not DONE:
                self.win = HTTPSWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        screen.popWindow()
        screen.finish()

if __name__ == "__main__":
    # Attempt to handle signal for Control+C
    try:
        signal.signal(signal.SIGINT, signal_handler)   
        ret = mainWindow()
    except KeyboardInterrupt:
        sys.exit()
