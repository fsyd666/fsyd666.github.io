---
title: arm交叉编译环境
date: 2017-11-23 14:15:30
tags:
categories: Linux
---

#交叉编译环境的搭建
1.到[buildroot.org](https://buildroot.org/download.html)去下载构建包
2.解压  make menuconfig 进入配置菜单 如下：
    <img src="http://www.cnitblog.com/images/cnitblog_com/gouzhuang/buildroot-2009.11-menuconfig.png" />
    主要介绍：
        `
        target Architecture  选择CPU平台
        Toolchain 工具链（默认没有勾选C++支持）
        Package Selection 选择扩展包（供编译使用，多选些编译 软件时就不需要编译第三方包了）
        主要在library里面。
        `
```
apt-get install autoconf automake bash bison bzip2 diffutils file flex g++ gawk gcc-multilib gettext gperf groff-base libncurses-dev libexpat1-dev libslang2 libssl-dev libtool libxml-parser-perl make patch perl pkg-config shtool tar texinfo unzip zlib1g zlib1g-dev bc
```
3.make  开始安装(很久)
4.安装完成： export PATH=$PATH:/opt/cross/host/bin 加入环境变量

5.aria2静态编译
```
MY_USR_DIR=/opt/cross/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
CC=arm-linux-gcc \
STRIP=arm-linux-strip \
CXX=arm-linux-g++ \
AR=arm-linux-ar \
RANLIB=arm-linux-ranlib \
KG_CONFIG_PATH=$MY_USR_DIR/lib/pkgconfig \
LD_LIBRARY_PATH=$MY_USR_DIR/lib \
./configure  \
ARIA2_STATIC=yes \
--host=arm-uclibc-linux \
LIBSSH2_CFLAGS=-I$MY_USR_DIR/include \
LIBSSH2_LIBS=$MY_USR_DIR/lib/libssh2.la \
SQLITE3_CFLAGS=-I$MY_USR_DIR/include \
SQLITE3_LIBS=$MY_USR_DIR/lib/libsqlite3.la

make
```
### 瘦身
```
arm-linux-strip -s src/aria2c
```
### 第三方包编译(很多时候需要依赖包都要自己编译):
iconv库安装
```
CC=arm-linux-gcc STRIP=arm-linux-strip CXX=arm-linux-g++ AR=arm-linux-ar RANLIB=arm-linux-ranlib ./configure --host=arm-uclibc-linux --prefix=/home/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/
make
```

