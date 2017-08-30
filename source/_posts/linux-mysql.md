---
title: linux-mysql
date: 2017-08-30 12:03:16
tags:
categories: Linux
---

#### 修改mysql root密码
```
service mysql stop
/usr/local/mysql/bin/mysqld_safe --skip-grant-tables >/dev/null 2>&1 &
mysql mysql -uroot;  (或者mysql -uroot;  use mysql; )
UPDATE user SET Password=PASSWORD('123456') where USER='root';
```