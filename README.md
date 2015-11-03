# zabbix

TO RUN DOCKERIZED ZABBIX AGENT:

1. create zabbix config directory on the host
```
mkdir -p /etc/zabbix/zabbix_agentd.d
```
2. Insert correct config file in /etc/zabbix directory. You can use example config **zabbix_agentd.conf**, just provide correct server ip address in config file
3. Set correct permissions for /etc/zabbix, zabbix user has UID=102, group has GID=105
```
chown -R 102:105 /etc/zabbix
```
4. Start a container.
```
docker run -d --net=host --pid=host --ipc=host --privileged=true  -v /dev:/dev -v /etc/zabbix:/etc/zabbix quay.io/lukaszl/zabbix 
```
5. Add zabbix agent to zabbix server through web UI.
