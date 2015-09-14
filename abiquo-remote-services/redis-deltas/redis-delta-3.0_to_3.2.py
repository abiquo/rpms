from subprocess import *
import md5
 
HOST = "localhost"
PORT = 6379
SPORT = str(PORT)
 
# Make sure we can connect to Redis
ret = call(["redis-cli", "-h", HOST, "-p", SPORT, "PING"], stdout=PIPE)
if ret:
    print("Unable to connect redis at", HOST, ":", SPORT)
    exit(1)
 
def hget(key, field):
    return Popen(["redis-cli", "-h", HOST, "-p", SPORT, "hget", key, field], stdout=PIPE).communicate()[0].strip()

# Delete all existing connection indices
cmd = Popen("redis-cli -h %s -p %d keys PhysicalMachine:connection:*" % (HOST, PORT), shell=True, stdout=PIPE)
for conn in cmd.stdout:
    conn_key = conn.strip() 
    if not conn_key:
        continue
    print "Deleting old connection index: %s" % conn_key
    call(["redis-cli", "-h", HOST, "-p", SPORT, "del", conn_key], stdout=PIPE)

# Recalculate the hash of each monitor
cmd = Popen("redis-cli -h %s -p %d smembers PhysicalMachine:all" % (HOST, PORT), shell=True, stdout=PIPE)
for pm in cmd.stdout:
    id = pm.strip() 
    if not id:
        continue

    key = "PhysicalMachine:%s" % (id)

    print "Processing monitor for: %s" % key

    monitor_type = hget(key, "type")
    endpoint = hget(key, "end_point")
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

    print " - Computing the new hash..."

    m = md5.new()
    m.update(monitor_type)
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

    print " - Creating new connection index: %s" % conn_index_key
    call(["redis-cli", "-h", HOST, "-p", SPORT, "set", conn_index_key, id], stdout=PIPE)

