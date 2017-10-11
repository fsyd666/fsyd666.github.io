---
title: Git记录
date: 2017-06-22 10:14:35
tags:
categories: Git
---

#### GitGui设置中文
`
复制zh_cn.msg文件到安装目录下：C:\Program Files\Git\mingw64\share\git-gui\lib\msgs 没有就建立对应目录
`
[zh_cn.msg文件下载](/data/git/zh_cn.msg)

#### Git配置文件基本注释
```
[core]   //核心配置
	repositoryformatversion = 0 //仓库格式版本
	filemode = false  //文件模式  设置为false 可以忽略chmod修改的权限信息
	bare = false //仅是仓库  否
	logallrefupdates = true  //记录所有更新日志
	symlinks = false  //符号链接
	ignorecase = true //忽略检测
	hideDotFiles = dotGitOnly //隐藏带点的文件  仅隐藏.git文件[夹]
[remote "origin"]  //远程源配置
	url = https://github.com/fsyd666/fsyd666.github.io.git  //远程源地址
	fetch = +refs/heads/*:refs/remotes/origin/*  //所取回的更新配置  
[branch "master"]  //master分支
	remote = origin  //远程源 
	merge = refs/heads/master  //合并到远程heads的/master  修改这个可使本地分支和远程分支不对应
[gui]  //显示配置
	wmstate = normal  //默认主题
	geometry = 799x475+809+327 159 214  //不知道 字面意思"几何结构"
[user] //用户
	name = your-name // 当前库的所使用的名字.  配置全局的使用 git config --global user.name = "your-name"
	email = your-email@vip.com  //当前库的所使用的Email. 配置全局的使用 git config --global user.email = "your-email@vip.com"
[branch "source"]  //另一个分支
	remote = origin //取远程源
	merge = refs/heads/source //合并到远程的source分支

```

### Git忽略
1. 没有被管控的文件
```
.gitignore文件添加
```
2. 已经推送（push）过的文件，想从git远程库中删除，并在以后的提交中忽略，但是却还想在本地保留这个文件
```
 git rm --cached Xml/config.xml    可使用通配符  Xml/*
.gitignore文件添加
```
3. 已经推送（push）过的文件，想在以后的提交时忽略此文件，即使本地已经修改过，而且不删除git远程库中相应文件
```
git update-index --assume-unchanged Xml/config.xml 可使用通配符  Xml/*
```