---
title: 梅林交叉编译环境
date: 2017-11-10 17:55:30
tags:
categories: Other
---

#Asuswrt-Merlin(ARM)交叉编译环境的搭建

这里说到的AC-68U(ac66u-b1)就是ARM平台的，Soc是BCM4708;我们的电脑如无意外都是X86平台，直接编译的程序并不能在路由执行。

注:华硕的AC-66U 、 N-66U为MIPS架构的Soc(BCM4706)，此教程不完全适用。

下载编译包 地址：https://github.com/RMerl/am-toolchains （猜测:使用中只用到：am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin/*）

#创建软连接，方便管理和调用
```
ln -s /home/soft/buildroot-2017.08.1/output/host/ /opt/armhost
```
#接下来是安装编译需要的组件，如果电脑装有这些软件的可以跳过
```
apt-get install autoconf automake bash bison bzip2 diffutils file flex g++ gawk gcc-multilib gettext gperf groff-base libncurses-dev libexpat1-dev libslang2 libssl-dev libtool libxml-parser-perl make patch perl pkg-config python sed shtool tar texinfo unzip zlib1g zlib1g-dev
```
#64位操作系统，需装32位的库 docker中注意 libelf 32位包安装不上问题
```
dpkg --add-architecture i386  #添加32位支持
apt-get update  #再更新一下
apt-get install lib32z1-dev lib32stdc++6 libelf1:i386
```
这样子环境的部署就大功告成了。
在每次开启一个终端要编译的时候，需要输入变量环境。（这是临时的）
```
export PATH=$PATH:/opt/armhost
```
这样子就可以去编译你需要的软件了，不过在configure之前记得加上这一段，举个例子
```
CC=arm-linux-gcc CXX=arm-linux-g++ AR=arm-linux-ar RANLIB=arm-linux-ranlib ./configure --host=arm-uclibc-linux
make 
```

