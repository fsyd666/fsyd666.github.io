#!/usr/bin/env bash
yum install -y ppp pptpd 
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd

echo "localip 192.168.88.1" >> /etc/pptpd.conf
echo "remoteip 192.168.88.200-238" >> /etc/pptpd.conf

sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf
sed -i 's/net.ipv4.tcp_syncookies/#net.ipv4.tcp_syncookies/g' sysctl.conf

sysctl -p

#»ñÈ¡Ip
local_ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`;


./iptables-clean.sh
service iptables stop
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 
iptables -t nat -A POSTROUTING -s 192.168.88.0/24 -j SNAT --to-source $local_ip
service iptables save
service iptables start

uname="pptpvpn";
pwd="123456";

echo "$uname	pptpd	$pwd	*"  >> /etc/ppp/chap-secrets

chkconfig pptpd on
service pptpd start

echo "
IP:$local_ip
username:$uname
password:$pwd
"
