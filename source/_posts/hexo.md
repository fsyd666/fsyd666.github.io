---
title: Hexo 安装使用
date: 2017-06-21 15:22:57
tags:
categories: 其他
---

1. 先安装nodejs
2. 安装hexo
`
npm install -g hexo
`
3. 初始化然后，执行init命令初始化hexo
   init 会使用 git 所以要把git加入到环境变量
`
hexo init
`
**安装完成**
-------------------------
#### 常用命令
+ 生成静态页面
`
hexo generate（hexo g也可以）
`
+ 启动本地服务，进行文章预览调试
`
hexo server
`
+ 生成新文件
`
hexo n 文件名
`
+ 更新hexo到最新版
`
npm update hexo -g
`

--------------------------------

#### 配置Github
1. 建立Repository  *fsyd666.github.io 必须这种格式 才能使用域名访问*
2. 修改 _config.yml 配置文件 的deploy如下
```
deploy:
    type: git
    repo: https://github.com/fsyd666/fsyd666.github.io.git
    branch: master
```
3. 执行如下命令：
```
npm install hexo-deployer-git
```
4. 部署:
```
hexo deploy
```
#### 每次部署步骤：
```
hexo g -d
```