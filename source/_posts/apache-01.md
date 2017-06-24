---
title: apache2.4以上版本vhost 403问题
date: 2017-06-24 11:41:07
tags:
categories: 其他
---

#### 在Vhost 项目中添加
```
<Directory />
    AllowOverride All
    Require all granted
</Directory>
```
主要是这句 Require all granted 2.2版本是不需要的