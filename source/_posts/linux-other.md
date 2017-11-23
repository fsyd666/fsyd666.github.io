---
title: Linux其他
date: 2017-06-22 11:13:15
tags:
categories: Linux
---

#多网卡配置方法
在VirtualBox生成一个nat(外网网卡) Host-Only(内网网卡)
eth0 外网 配置默认 dhcp模式
eth1 内网 静态ip配置  HWADDR(mac地址)要配置正确
查看 MAC配置 cat /etc/udev/rules.d/70-persistent-net.rules

#eth0配置(外网)：
```
DEVICE=eth0
TYPE=Ethernet
HWADDR=08:00:27:68:8e:cd
UUID=112836d5-3ea3-4c7b-9b81-373b4e0b1127
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=dhcp
```
#eth1配置(内网)：
```
DEVICE=eth1
TYPE=Ethernet
HWADDR=08:00:27:ad:a0:80
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
IPADDR=192.168.56.88
NETMASK=255.255.255.0
#GATWAY 这一定不能填，否则不能上网
```
#route配置(临时配置，重启网络失效)：
```
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.2.0        *               255.255.255.0   U     0      0        0 eth0
192.168.56.0    *               255.255.255.0   U     0      0        0 eth1
link-local      *               255.255.0.0     U     1002   0        0 eth0
link-local      *               255.255.0.0     U     1003   0        0 eth1
default         10.0.2.2        0.0.0.0         UG    0      0        0 eth0
主要查看 default 的 gateway 值，如果是内网值，就 
route del default 
route add default gw 10.0.2.2
```
#/etc/sysconfig/network配置：
```
添加外网网关
GATEWAY=10.0.2.2
```

