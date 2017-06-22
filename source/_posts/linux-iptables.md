---
title: centOs6.4 iptables配置
date: 2017-06-21 17:31:42
tags:
categories: Linux
---
## CentOS6.4 配置iptables


#### 选择规则表，这个一定要先做，不然清空后可能会悲剧
```
iptables -P INPUT ACCEPT
```
#### 清空默认所有规则 
```
iptables -F
```
#### 清空自定义的所有规则 
```
iptables -X
```
#### 计数器置0
```
 iptables -Z
```
#### 如果没有此规则，你将不能通过127.0.0.1访问本地服务，例如ping 127.0.0.1 
```
iptables -A INPUT -i lo -j ACCEPT    
```
#### 开启ssh端口22 
```
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```
#### 开启FTP端口21 
```
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
```
#### 开启web服务端口80
```
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```
#### tomcat 
```
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
```
#### mysql 
```
iptables -A INPUT -p tcp --dport xxxx -j ACCEPT
```
#### 允许icmp包通过,也就是允许ping 
```
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
```

#### 允许所有对外请求的返回包 ,本机对外请求相当于OUTPUT,对于返回数据包必须接收啊，这相当于INPUT了 
```
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
```
#### 如果要添加内网ip信任（接受其所有TCP请求） 
```
iptables -A INPUT -p tcp -s 45.96.174.68 -j ACCEPT
```
#### 每秒中最多允许5个新连接
```
iptables -A FORWARD -p tcp --syn -m limit --limit 1/s --limit-burst 5 -j ACCEPT
```
#### 每秒中最多允许5个新连接
```
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
```
#### 开放多个端口
```
iptables -A INPUT -p tcp --dport 8888:8899 -j ACCEPT
```
#### Ping洪水攻击
```
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
```
#### 封单个IP的命令是：
```
iptables -I INPUT -s 222.34.135.106 -j DROP
```
#### 封IP段的命令是：
```
iptables -I INPUT -s 211.1.0.0/16 -j DROP
iptables -I INPUT -s 211.2.0.0/16 -j DROP
iptables -I INPUT -s 211.3.0.0/16 -j DROP
```
#### 封整个段的命令是：
```
iptables -I INPUT -s 211.0.0.0/8 -j DROP
```
#### 封几个段的命令是：
```
iptables -I INPUT -s 61.37.80.0/24 -j DROP
iptables -I INPUT -s 61.37.81.0/24 -j DROP
```
#### 过滤所有非以上规则的请求 
```
iptables -P INPUT DROP
```

#### 保存重启 
```
service iptables save
service iptables restart
```
#### 删除规则用-D参数

```
iptables -D INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
```