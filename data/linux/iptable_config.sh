iptables -P INPUT ACCEPT
iptables -F
iptables -X
iptables -Z

#���û�д˹����㽫����ͨ��127.0.0.1���ʱ��ط�������ping 127.0.0.1 
iptables -A INPUT -i lo -j ACCEPT    

iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j ACCEPT


#FTP����ģʽ�˿�
iptables -A INPUT -p tcp --dport 10000:10010 -j ACCEPT
#ICMP
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
#�������ж�������ķ��ذ� 
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
#Ping��ˮ����
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
#�������з����Ϲ�������� 
iptables -P INPUT DROP

service iptables save
service iptables restart