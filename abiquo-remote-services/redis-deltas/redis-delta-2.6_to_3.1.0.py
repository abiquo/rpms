from subprocess import *
import urlparse
import re
import md5
 
HOST = "localhost"
PORT = 6379
SPORT = str(PORT)
 
# Ping!
ret = call(["redis-cli", "-h", HOST, "-p", SPORT, "PING"], stdout=PIPE)
 
if ret:
    print("Unable to connect redis at", HOST, ":", SPORT)
    exit(1)
 
def hget(key, field):
    return Popen(["redis-cli", "-h", HOST, "-p", SPORT, "hget", key, field], stdout=PIPE).communicate()[0].strip()

# For each monitor...
cmd = Popen("redis-cli -h %s -p %d smembers PhysicalMachine:all" % (HOST, PORT), shell=True, stdout=PIPE)
for pm in cmd.stdout:
    id = pm.strip() 
    if not id:
        continue

    key = "PhysicalMachine:%s" % (id)
    monitor_type = hget(key, "type")
    ip = hget(key, "ip")
    port = hget(key, "port")
    user = hget(key, "username")
    password = hget(key, "password")
    managerip = hget(key, "manager_ip")
    managerport = hget(key, "manager_port")
    manageruser = hget(key, "manager_username")
    managerpassword = hget(key, "manager_password")
    agentip = hget(key, "agent_ip")
    agentport = hget(key, "agent_port")
    agentuser = hget(key, "agent_username")
    agentpassword = hget(key, "agent_password")
    ip_index_key = "PhysicalMachine:address:%s" % (ip)

    # For AMAZON monitors, use end_point field
    if ip and ":" in ip and monitor_type == "AMAZON":
        end_point = ip.split(":")[1]
        call(["redis-cli", "-h", HOST, "-p", SPORT, "hset", key, "ip", ""], stdout=PIPE)
        call(["redis-cli", "-h", HOST, "-p", SPORT, "hset", key, "end_point", end_point], stdout=PIPE)
    else:
         call(["redis-cli", "-h", HOST, "-p", SPORT, "hset", key, "end_point", ""], stdout=PIPE)

    # Create index by connection data
    endpoint = hget(key, "end_point")
    ip = hget(key, "ip")

    m = md5.new()
    m.update(endpoint)
    m.update(ip)
    m.update(user)
    m.update(password)
    m.update(port)
    m.update(managerip)
    m.update(manageruser)
    m.update(managerpassword)
    m.update(managerport)
    m.update(agentip)
    m.update(agentuser)
    m.update(agentpassword)
    m.update(agentport)
    digest = m.hexdigest()
    conn_index_key = "PhysicalMachine:connection:%s" % (digest)
    uid_index_key = "PhysicalMachine:uid:%s" % (digest)

    # Data
    call(["redis-cli", "-h", HOST, "-p", SPORT, "hset", key, "uid", digest], stdout=PIPE)
            
    # Indices
    call(["redis-cli", "-h", HOST, "-p", SPORT, "del", ip_index_key], stdout=PIPE)
    call(["redis-cli", "-h", HOST, "-p", SPORT, "set", conn_index_key, id], stdout=PIPE)
    call(["redis-cli", "-h", HOST, "-p", SPORT, "set", uid_index_key, id], stdout=PIPE)

# For each subscription
cmd = Popen("redis-cli -h %s -p %d smembers VirtualMachine:all" % (HOST, PORT), shell=True, stdout=PIPE)
for vm in cmd.stdout: 
    id = vm.strip()
    if not id:
        continue

    # Index subscriptions by monitor id
    key = "VirtualMachine:%s" % (id)
 
    monitor_id = hget(key, "physicalMachine_id")
    index_key = "VirtualMachine:byMonitor:%s" % (monitor_id)
    
    call(["redis-cli", "-h", HOST, "-p", SPORT, "sadd", index_key, id], stdout=PIPE)