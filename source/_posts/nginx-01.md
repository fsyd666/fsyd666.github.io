---
title: nginx 配置
date: 2017-06-30 14:38:02
tags:
categories: Linux
---

#### 301重定向域名
```
if($host!='www.xxxx.com'){   #host变量表示主机名
    rewrite ^/(.*)$ http://www.xxxx.net/$1 permanent;  #permanent表示永久重定向
}
```
#### 普通地址重定向
`
把 http://example.com/test.php?para=xxx 重定向到 http://example.com/new
`
```
rewrite ^/test.php(.*) /new? permanent; #重定向后不带参数
```
`
把 http://example.com/test.php?para=xxx 重定向到 http://example.com/new?para=xxx
`
```
rewrite ^/test.php(.*) /new permanent;  #重定向后带参数
```
`
把 http://example.com/test.php?para=xxx 重定向到 http://example.com/new
`
```
rewrite  ^/test.php/new?id=$arg_id?  permanent;    #重定向后带指定的参数
```

#### 去除index.php
```
#方法1
location / {
    if (!-e $request_filename){
        rewrite ^/(.*)$ /index.PHP/$1 last;
    }
}
#方法2
location / {
    try_files $uri $uri/ /index.php$is_args$args;
}
```

#### 一个虚拟主机的配置
```
server
    {
        listen 80;
        server_name www.xx.com xx.com;
        index index.php;
        root  /www/xx;

        #error_page   404   /404.html;
        #禁止访问指定的目录下的PHP文件
        location ~ /(wp-content|uploads|wp-includes|images)/.*\.php$ { deny all; }  

	#重定向
	if ($host != 'www.xx.com') {
		rewrite ^/(.*)$ http://www.xx.com$1 permanent;
	}

	location / {
		# Redirect everything that isn't a real file to index.php
		try_files $uri $uri/ /index.php$is_args$args;
	}

        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
        {
            expires      30d;
        }

        location ~ .*\.(js|css)?$
        {
            expires      12h;
        }

        location ~ /.well-known {
            allow all;
        }

        location ~ /\.
        {
            deny all;
        }

        access_log off;
    }

```
