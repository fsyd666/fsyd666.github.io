---
title: apache
date: 2017-06-24 11:41:07
tags:
categories: 其他
---

#### apache2.4以上版本vhost 403问题
```
在Vhost 项目中添加
<Directory />
    AllowOverride All
    Require all granted
</Directory>
```
主要是这句 Require all granted 2.2版本是不需要的

#### 检测配置文件错误 导致不能启动
```
windows : httpd -t
linux   : ./apachectl configtest
正确显示 : Syntax OK
错误显示 : 类似AH00526: Syntax error on line 339 of conf/httpd.conf:
```