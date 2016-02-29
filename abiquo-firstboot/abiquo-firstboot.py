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
import hashlib
from rfc3987 import parse
from augeas import Augeas

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

class JceWindow:
    def __init__(self,screen):
        self.screen = screen
        self.text = TextboxReflowed(75,"The installation process is about to download the JCE library. The license can be read here:\n\nhttp://www.oracle.com/technetwork/java/javase/terms/license/index.html\n\nIf you don't want to accept the license, press ESC to cancel the download -  but your Abiquo installation will NOT work without it!\n")
        self.grid = GridForm(self.screen, "JCE download", 1, 2)
        self.bb = ButtonBar(self.screen, ["Accept"],compact=1)
        self.grid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid.add(self.bb,0,1,growx = 1)

    def run(self):
        result = self.grid.run()
        rc = self.bb.buttonPressed(result)
        if not rc:
            return 0
        else:
            self.screen.popWindow()
            ButtonChoiceWindow(self.screen,"Downloading JCE", "The download may take a while. Please wait.\n", buttons = ["OK"], width = 40)

            download_error = self.download_jce()
            if download_error:
                self.screen.popWindow()
                ButtonChoiceWindow(self.screen,"Error downloading JCE","Unable to download the JCE library. Please follow these steps in another terminal to do it manually:\n\nwget --no-check-certificate --no-cookies \ \n--header \"Cookie: oraclelicense=accept-securebackup-cookie\" -O /tmp/JCE.zip \ \nhttp://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip\n\nunzip -o -j /tmp/JCE.zip -d /usr/java/default/jre/lib/security/\n", buttons = ["OK"], width = 70)
            return 0

    def download_jce(self):
        try:
            p = subprocess.call("wget --no-check-certificate --no-cookies --header \"Cookie: oraclelicense=accept-securebackup-cookie\" -O /tmp/JCE.zip http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip", shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            p = subprocess.call("sleep 3", shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            p = subprocess.call("unzip -o -j /tmp/JCE.zip -d /usr/java/default/jre/lib/security/", shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)

            #verifying  JCE zip is properly downloaded
            return  hashlib.md5(open('/tmp/JCE.zip').read()).hexdigest() != 'b3c7031bc65c28c2340302065e7d00d3'
        except Exception:
            logging.error("Error downloading the JCE")
            return 1

class MUserWindow:
    def __init__(self,screen):
        self.screen = screen
        self.conf_path = '/opt/abiquo/config/abiquo.properties'
        self.text = TextboxReflowed(75,"This step will extract M user credentials from database and configure them as properties")
        self.grid = GridForm(self.screen, "M user configuration", 1, 2)
        self.bb = ButtonBar(self.screen, ["Accept","Cancel"],compact=1)
        self.grid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid.add(self.bb,0,1,growx = 1)

    def run(self):
        result = self.grid.run()
        rc = self.bb.buttonPressed(result)
        if rc == 'cancel':
            return -1
        else:
            self.screen.popWindow()
            self.configure_m_credentials()
            return 0


    def configure_m_credentials(self):
        try:
            m_password = commands.getoutput("mysql kinton -e 'select COMMENTS from DATABASECHANGELOG where ID = \"default_user_for_m\";' --skip-column-names")
            logging.info("Default M user password %s"% m_password)
        except Exception as e:
            logging.error("Error getting credentials from database")

        config = ConfigParser.ConfigParser()
        config.optionxform = str
        if os.path.exists(self.conf_path):
            try:
                config.readfp(open(self.conf_path))
                config.set('server','abiquo.m.credential', m_password)
                config.set('server','abiquo.m.identity','default_outbound_api_user')
                config.write(open(self.conf_path,'wa'))
                logging.info("M credentials set as {0} / {1}".format('default_outbound_api_user',m_password))
            except Exception as e:
                logging.error("Cannot set M credentials to properties file. Error: {0}".format(e) )
        else:
            logging.error("Abiquo properties file not found!")

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
        self.topgrid = GridForm(self.screen, "NFS repository", 1, 3)
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
                f.close()
        if os.path.exists(self.conf_path):
            try:
                config.readfp(open(self.conf_path))
                config.set('remote-services', 'abiquo.appliancemanager.repositoryLocation', url)
                config.write(open(self.conf_path,'wa'))
                config.close()
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

class MonitoringWindow:
    def __init__(self,screen):
        self.delorean_conf = '/etc/abiquo/watchtower/delorean.conf'
        self.emmett_conf = '/etc/abiquo/watchtower/emmett.conf'

        self.screen = screen
        self.label_address = Label('RabbitMQ address:')
        self.entry_address = Entry(30)
        self.entry_user = Entry(30, "abiquo")
        self.label_user = Label('RabbitMQ username:')
        self.entry_pass = Entry(30, "abiquo")
        self.label_pass = Label('RabbitMQ password:')
        self.text = TextboxReflowed(50,"Abiquo Watchtower needs to know where your RabbitMQ server is located. This is the same RabbitMQ server your Abiquo API uses.\n")
        self.topgrid = GridForm(self.screen, "Abiquo Watchtower Configuration", 1, 3)
        self.topgrid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid = Grid(2, 3)
        self.grid.setField (self.label_address, 0, 0, (0, 0, 1, 0), anchorLeft = 1)
        self.grid.setField (self.entry_address, 1, 0)
        self.grid.setField (self.label_user, 0, 1, (0, 0, 2, 0), anchorLeft = 1)
        self.grid.setField (self.entry_user, 1, 1)
        self.grid.setField (self.label_pass, 0, 2, (0, 0, 1, 0), anchorLeft = 1)
        self.grid.setField (self.entry_pass, 1, 2)
        self.topgrid.add (self.grid, 0, 1, (0, 0, 0, 1))
        self.bb = ButtonBar (self.screen, ["OK","Cancel"],compact=1)
        self.topgrid.add (self.bb, 0, 2, growx = 1)

    def run(self):
        self.topgrid.setCurrent(self.entry_address)
        result = self.topgrid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "cancel":
            return -1
        else:
            logging.info("OK")
            delorean_tmp = '/tmp/delorean.json'
            emmett_tmp = '/tmp/emmett.json'
            # Config files are HOCON format... Whatever that is...
            # We need to turn them to something we can manage.
            p = subprocess.call('pyhocon -i %s -o %s -f json' % (self.delorean_conf, delorean_tmp) , shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            if p != 0:
                logging.error("Could not convert delorean.conf to JSON!")
                exit(1)
            
            with open(delorean_tmp) as delorean_conf:
                data = json.load(delorean_conf)
            data['amqp']['rabbitmq']['host'] = self.entry_address.value()
            data['amqp']['rabbitmq']['username'] = self.entry_user.value()
            data['amqp']['rabbitmq']['password'] = self.entry_pass.value()
            with open(delorean_tmp, 'w') as delorean_conf:
                json.dump(data, delorean_conf)
            p = subprocess.call('pyhocon -i %s -o %s -f hocon' % (delorean_tmp, self.delorean_conf) , shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            if p != 0:
                logging.error("Could not convert delorean.conf back to HOCON!")
                exit(1)

            # Now emmett
            p = subprocess.call('pyhocon -i %s -o %s -f json' % (self.emmett_conf, emmett_tmp) , shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            if p != 0:
                logging.error("Could not convert emmett.conf to JSON!")
                exit(1)
            
            with open(emmett_tmp) as emmett_conf:
                data = json.load(emmett_conf)
            data['amqp']['rabbitmq']['host'] = self.entry_address.value()
            data['amqp']['rabbitmq']['username'] = self.entry_user.value()
            data['amqp']['rabbitmq']['password'] = self.entry_pass.value()
            with open(emmett_tmp, 'w') as emmett_conf:
                json.dump(data, emmett_conf)
            p = subprocess.call('pyhocon -i %s -o %s -f hocon' % (emmett_tmp, self.emmett_conf) , shell=True, stdout=open('/dev/null', 'w'), stderr=subprocess.STDOUT)
            if p != 0:
                logging.error("Could not convert emmett.conf back to HOCON!")
                exit(1)
            
            return 0

class ApiWindow:
    def __init__(self,screen,profiles):
        self.conf_path = '/var/www/html/ui/config/client-config-custom.json'
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
            self.ip = re.search('://(.+?)/', self.entry.value()).group(1)
            self.defaulturl = self.entry.value()
            self.set_api_url(self.entry.value())
            self.set_server_ip()
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
        try:
            p = parse(url, rule='IRI')
            if p != None:
                return True
            else:
                return False
        except ValueError:    
            return False

    def set_server_ip(self):
        config = ConfigParser.ConfigParser()
        config.optionxform = str
        conf_path = '/opt/abiquo/config/abiquo.properties'
        if os.path.exists(conf_path):
            try:
                ip = detect_public_ip()
                config.readfp(open(conf_path))
                if config.has_section('remote-services'):
                    config.set('remote-services', 'abiquo.server.api.location', 'http://'+ip+':8009/api')
                if config.has_section('server'):
                    config.set('server', 'abiquo.server.api.location', 'http://'+ip+':8009/api')
                config.write(open(conf_path,'wa'))
                config.close()
            except Exception as e:
                logging.error('Cannot set API endpoint: %s' % e)

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
                config.close()
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
                config.close()
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
    def __init__(self, screen, set_timeouts):
        self.screen = screen
        self.text = TextboxReflowed(50,"Do you want to enable secure SSL front-end?\n")
        self.grid = GridForm(self.screen, "Enable HTTPS", 1, 2)
        self.bb = ButtonBar(self.screen, ["No","Yes"],compact=1)
        self.grid.add(self.text,0,0,(0, 0, 0, 1))
        self.grid.add(self.bb,0,1,growx = 1)       
        self.abiquo_conf = '/etc/httpd/conf.d/abiquo.conf'
        self.abiquo_conf_example = '/usr/share/doc/abiquo-ui/abiquo.conf'
        self.ssl_conf = '/etc/httpd/conf.d/ssl.conf'
        self.ssl_conf_example = '/usr/share/doc/abiquo-ui/ssl.conf'
        self.abiquo_ssl_conf = '/etc/httpd/conf.d/abiquo_ssl.conf'
        self.abiquo_ssl_conf_example = '/usr/share/doc/abiquo-ui/abiquo_ssl.conf'
        self.abiquo_generate_certs = '/usr/share/doc/abiquo-ui/create_certs.sh'
        self.tomcat_server_conf = '/opt/abiquo/tomcat/conf/server.xml'
        self.tomcat_server_ssl_conf_example = '/usr/share/doc/abiquo-core/examples/tomcat/server_ssl.xml'
        self.ui_conf_path = '/var/www/html/ui/config/client-config-custom.json'
        self.set_timeouts = set_timeouts
        self.https = False

    def set_api_timeouts(self, timeout):
        # Determine the file to change
        if self.https:
            config_file = self.abiquo_ssl_conf
        else:
            config_file = self.abiquo_conf
        logging.info("Setting Proxy timeouts in %s" % config_file)

        # Set timeout using Augeas
        a = Augeas()
        for loc in a.match("/files%s/VirtualHost/*[arg='/api']" % config_file):
            proxy_pass = a.match("%s/*[self::directive='ProxyPass']" % loc)
            if len(proxy_pass) == 1:
                # Proxy timeout already exists
                logging.info("ProxyPass found")
                arg1 = a.get("%s/arg" % proxy_pass[0])
                arg2 = "timeout=%s" % timeout
                a.set("%s/arg[1]" % proxy_pass[0], arg1)
                a.set("%s/arg[2]" % proxy_pass[0], arg2)

            a.save()
            a.close()

    def run(self):
        result = self.grid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "no":
            self.https = False
            self.set_http()
        else:
            # Generate certs and set HTTPS in apache
            self.https = True
            self.set_https()
        if self.set_timeouts:
            self.set_api_timeouts("600")
        return 0

    def set_http(self):
        if os.path.exists(self.abiquo_conf_example):
            shutil.move(self.abiquo_conf_example, self.abiquo_conf)
        else:
            logging.warning("abiquo.conf missing")

        try:
            upd_lic_url = commands.getoutput("mysql kinton -e \"update system_properties set value = 'http://www.abiquo.com/license' where name = 'client.dashboard.licenseUrl'\"")
            logging.info("Updated license request url to use http")
        except Exception as e:
            logging.error("Error updating license request url.")

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
                conf.close()
                with open(self.ui_conf_path, "wb") as out:
                    for line in lines:
                        out.write(re.sub(r'http:','https:',line))
                out.close()
            except Exception:
                logging.warning("Failed setting https in "+self.ui_conf_path+" :\n"+str(err))
        else:
            logging.warning("UI config not found")

        try:
            upd_lic_url = commands.getoutput("mysql kinton -e \"update system_properties set value = 'https://www.abiquo.com/license' where name = 'client.dashboard.licenseUrl'\"")
            logging.info("Updated license request url to use https")
        except Exception as e:
            logging.error("Error updating license request url. Will not be able to request due to mixed content.")

class DHCPRelayWindow:
    def __init__(self,screen):
        self.all_nics = commands.getoutput('ifconfig | egrep -v "^ |^$|\.|lo" | awk \'{print $1}\'').split('\n')
        self.screen = screen
        self.grid = GridForm(self.screen, "DHCP Relay Configuration", 3, 8)
        self.text_mgmt_nic = TextboxReflowed(25,"Management interface:".ljust(25))
        self.list_mgmt_nic = Listbox(height=3, width=20, scroll=1)
        self.text_svc_nic = TextboxReflowed(25,"Service interface:".ljust(25))
        self.list_svc_nic = Listbox(height=3, width=20, scroll=1)
        for idx, val in enumerate(self.all_nics):
            self.list_mgmt_nic.append(val, idx)
            self.list_svc_nic.append(val, idx)
        self.text_dhcp_server = TextboxReflowed(25,"DHCP server IP:".ljust(25))
        self.entry_dhcp_server = Entry(width=20)
        self.text_svc_net = TextboxReflowed(25,"Service network:".ljust(25))
        self.entry_svc_net = Entry(width=20)
        self.text_vlan_range = TextboxReflowed(25,"VLAN range:".ljust(25))
        self.text_vlan_from = TextboxReflowed(25,"from:".rjust(25))
        self.text_vlan_to = TextboxReflowed(25,"to:".rjust(25))
        self.entry_vlan_from = Entry(width=5)
        self.entry_vlan_to = Entry(width=5)
        self.accept_btn = Button("Accept")
        self.cancel_btn = Button("Cancel")
        
        self.grid.add(self.text_mgmt_nic,0,0,(1,0,0,0))
        self.grid.add(self.list_mgmt_nic,1,0,(0,0,1,0),anchorLeft=1)
        self.grid.add(self.text_svc_nic,0,1,(1,0,0,0))
        self.grid.add(self.list_svc_nic,1,1,(0,0,1,0),anchorLeft=1)
        self.grid.add(self.text_dhcp_server,0,2,(1,0,0,0))
        self.grid.add(self.entry_dhcp_server,1,2,(0,0,1,0),anchorLeft=1)
        self.grid.add(self.text_svc_net,0,3,(1,0,0,0))
        self.grid.add(self.entry_svc_net,1,3,(0,0,1,0),anchorLeft=1)
        self.grid.add(self.text_vlan_range,0,4,(1,0,0,0))
        self.grid.add(self.text_vlan_from,0,5,(1,0,0,0))
        self.grid.add(self.entry_vlan_from,1,5,(0,0,1,0),anchorLeft=1)
        self.grid.add(self.text_vlan_to,0,6,(1,0,0,0))
        self.grid.add(self.entry_vlan_to,1,6,(0,0,1,1),anchorLeft=1)
        self.grid.add(self.accept_btn,0,7)
        self.grid.add(self.cancel_btn,1,7)

    def run(self):
        result = self.grid.run()
        if result == self.cancel_btn:
            logging.info("Cancel")
            return 0
        else:
            logging.info("Accept")
            for idx, val in enumerate(self.all_nics):
                if idx == self.list_svc_nic.current():
                    mgmt_nic = val
                    svc_nic = val

                    retcode, output = commands.getstatusoutput(
                        "cd /tmp && /usr/bin/abiquo-dhcp-relay -r %s -s %s -v %s-%s -x %s -n %s && mv /tmp/relay-config /etc/init.d/relay-config" %
                        (mgmt_nic, svc_nic, self.entry_vlan_from.value(), self.entry_vlan_to.value(), self.entry_dhcp_server.value(),
                            self.entry_svc_net.value()))
                    if retcode == 0:
                        logging.info("Successfully reconfigured DHCP relay.")
                        logging.info("Restarting service.")
                        retcode = commands.getstatus("/etc/init.d/relay-config restart")

                        if retcode == 0:
                            logging.info("Done.")
                        else:
                            logging.error("Something went wrong restarting service. Check system logs.")
                    else:
                        logging.error("Error configuring DHCP relay.")
                        logging.error(output)
                        return 1
            return 0

class SummaryWindow:
    def __init__(self,screen,ui_capable,azure=False):
        text = ""
        if ui_capable:
            text = "Configuration saved.\n\nPlease restart Abiquo tomcat and Apache services to apply configuration:\n\n$ sudo service httpd restart\n$ sudo service abiquo-tomcat restart\n\n"
        else:
            text = "Configuration saved.\n\nPlease restart Abiquo tomcat service to apply configuration:\n\n$ sudo service abiquo-tomcat restart\n\n"

        if ui_capable:
            with open("/var/www/html/ui/config/client-config-custom.json") as data_file:
                data = json.load(data_file)
            uri = data['config.endpoint'].replace('api','ui')
            if azure:
                self.text = TextboxReflowed(50, text + "You may now log into %s \n\nUI credentials\n  User: admin\n  Password: xabiquo\n\nPlease change these passwords after logging in for the first time.\n\n" % uri)
            else:
                self.text = TextboxReflowed(50,"You may now log into %s \n\nUI credentials\n  User: admin\n  Password: xabiquo\n\nAppliance credentials:\n  User: root\n  Password: temporal\n\nPlease change these passwords after logging in for the first time.\n\n" % uri)
        else:
            if azure:
                self.text = TextboxReflowed(50, text)
            else:
                self.text = TextboxReflowed(50,"You may now log into this appliance with credentials:\n\n  User: root\n  Password: temporal\n\nPlease change these passwords after logging in for the first time.\n\n")
        self.screen = screen
        self.topgrid = GridForm(self.screen, "Configuration Finished!", 1, 3)
        self.topgrid.add(self.text,0,0,(0, 0, 0, 1))
        self.bb = ButtonBar (self.screen, ["OK"],compact=1)
        self.topgrid.add (self.bb, 0, 2, growx = 1)

    def run(self):
        result = self.topgrid.run()
        rc = self.bb.buttonPressed(result)
        if rc == "OK":
            return 0 
        else:
            return -1

class mainWindow:
    def __init__(self):
        logging.basicConfig(filename='/var/log/abiquo-firstboot.log',level=logging.DEBUG,format='%(asctime)s - %(levelname)s: %(message)s')
        # profiles from /etc/abiquo-installer
        profiles = ""
        screen = SnackScreen()
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

        #TODO check that the library is not already installed
        # JCE
        DONE = 0
        if os.path.exists("/usr/java/default/jre/lib/"):
            local_policy_sum = hashlib.md5(open('/usr/java/default/jre/lib/security/local_policy.jar').read()).hexdigest()
            us_export_policy_sum = hashlib.md5(open('/usr/java/default/jre/lib/security/US_export_policy.jar').read()).hexdigest()

            if local_policy_sum != 'dabfcb23d7bf9bf5a201c3f6ea9bfb2c' or us_export_policy_sum != 'ef6e8eae7d1876d7f05d765d2c2e0529':
                while not DONE:
                    self.win = JceWindow(screen)
                    rc = self.win.run()
                    screen.popWindow()
                    if rc == -1:
                        DONE = 1
                    elif rc == 0:
                        DONE = 1
            else:
                logging.info("Not downloading JCE jars as they are already correct.")

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
        if any(p in profiles for p in ['abiquo-monolithic', 'abiquo-monolithic-azure', 'abiquo-v2v', 'abiquo-remote-services', 'abiquo-remote-services-azure', 'abiquo-public-cloud']):
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
        if any(p in profiles for p in ['abiquo-distributed', 'abiquo-remote-services', 'abiquo-remote-services-azure', 'abiquo-v2v', 'abiquo-public-cloud']) \
            and not any(p in profiles for p in ['abiquo-server', 'abiquo-server-azure', 'abiquo-standalone-api', 'abiquo-ui']):
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
        if any(p in profiles for p in ['abiquo-ui','abiquo-monolithic','abiquo-monolithic-azure','abiquo-server','abiquo-server-azure']):
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
                if any(p in profiles for p in ['abiquo-monolithic-azure','abiquo-server-azure']):
                    self.win = HTTPSWindow(screen, True)
                else:
                    self.win = HTTPSWindow(screen, False)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        # M user window
        if any(p in profiles for p in ['abiquo-ui','abiquo-monolithic','abiquo-server','abiquo-monolithic-azure','abiquo-server-azure']):
            while not DONE:
                self.win = MUserWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
            DONE = 0
            
        # DHCP RELAY
        if any(p in profiles for p in ['abiquo-dhcp-relay']):
            while not DONE:
                self.win = DHCPRelayWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        # Watchtower
        if any(p in profiles for p in ['abiquo-monitoring']):
            while not DONE:
                self.win = MonitoringWindow(screen)
                rc = self.win.run()
                if rc == -1:
                    screen.popWindow()
                    DONE = 1
                elif rc == 0:
                    screen.popWindow()
                    DONE = 1
        DONE = 0

        # Show connection INFO
        while not DONE:
            if any(p in profiles for p in ['abiquo-monolithic-azure','abiquo-server-azure']):
                self.win = SummaryWindow(screen, True, True)
            elif any(p in profiles for p in ['abiquo-ui','abiquo-monolithic']):
                self.win = SummaryWindow(screen, True)
            elif any(p in profiles for p in ['abiquo-remote-services-azure']):
                self.win = SummaryWindow(screen, False, True)
            else:
                self.win = SummaryWindow(screen, False)
            rc = self.win.run()
            if rc == -1 or rc == 0:
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
