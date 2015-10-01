#!/bin/bash

start-stop-daemon --oknodo --start --pidfile /var/run/zabbix/zabbix.pid --exec /usr/sbin/zabbix_agentd
tailf /var/log/zabbix/zabbix_agentd.log
