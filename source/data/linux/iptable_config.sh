iptables -P INPUT ACCEPT
iptables -F
iptables -X
iptables -Z

#如果没有此规则，你将不能通过127.0.0.1访问本地服务，例如ping 127.0.0.1 
iptables -A INPUT -i lo -j ACCEPT    

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j ACCEPT


#FTP被动模式端口
iptables -A INPUT -p tcp --dport 10000:10010 -j ACCEPT
#ICMP
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
#允许所有对外请求的返回包 
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
#Ping洪水攻击
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
#过滤所有非以上规则的请求 
iptables -P INPUT DROP

service iptables save
service iptables restart