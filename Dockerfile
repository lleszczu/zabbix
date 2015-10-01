FROM ubuntu:14.04
MAINTAINER lukasz.leszczuk@intel.com

ENV http_proxy http://proxy-mu.intel.com:911
ENV https_proxy http://proxy-mu.intel.com:911

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget

RUN wget http://repo.zabbix.com/zabbix/2.4/debian/pool/main/z/zabbix-release/zabbix-release_2.4-1+wheezy_all.deb \
 && dpkg -i zabbix-release_2.4-1+wheezy_all.deb

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  zabbix-agent    

RUN mkdir /var/run/zabbix && \
 chown -R zabbix:zabbix /var/run/zabbix && \
 mkdir -p /etc/zabbix/zabbix_agentd.d && \
 chown -R zabbix:zabbix /etc/zabbix

VOLUME [ "/etc/zabbix" ]
COPY start.sh /
CMD [ "/start.sh"]
