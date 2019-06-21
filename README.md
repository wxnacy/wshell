# Wshell

Wshell 是集成化的 Linux 服务器脚本，主旨是尽量将常用软件的复杂安装过程和操作一键化，提高工作效率。

**适配**

- MacOS
- Ubuntu
- Debian
- CentOS

## 安装

### MacOS

**安装**

```bash
$ brew tap wxnacy/tap && brew install wshell
```

**更新**

```bash
$ brew update && brew upgrade wshell
```

### Linux

**安装最新版**

安装前需要确保系统中已经安装 `curl, git, expect`

```bash
$ sudo apt/yum install -y curl git
```

curl

```bash
$ curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/wshell-installer | bash
```

**配置环境**

```bash
$ echo 'export WS_HOME=${HOME}/.wshell' >> ~/.bashrc
$ echo 'export PATH=${WS_HOME}/bin:$PATH' >> ~/.bashrc
$ echo '. ${WS_HOME}/conf/bash/bashrc' >> ~/.bashrc
$ source ~/.bashrc
```

**查看版本**


**更新到最新版本**

```bash
$ ws update
```

## 语法

```bash
$ ws[hell] <command> [args...]
```

## 命令

### 查看版本

```bash
$ ws version
```

### 更新版本

更新 Wshell 到最新版

```bash
$ ws update
```

### 检查支持软件的安装情况

```bash
$ ws check
```

### 安装系统软件

一键安装软件，如

```bash
$ wshell install java
```

现在支持的软件

- `mysql` 5.7.x
- `java` OpenJDK 1.8.0
- `nvm` 0.34.0
- `es, elasticsearch` Elasticsearch 6.x 最新版
- `pyenv`
- `docker`
- `ack`
- `dig`
- `htop`
- `http` httpie
- `wvim`
- `ssr` 安装后会自动重启，随后登陆执行 `bash serverspeeder-all.sh` 安装加速服务
- `system`

**system**

包含了系统常用的基础软件

```bash
gcc, g++, make, cmake, git, vim, wget, unzip, expect, htop, httpie, patch, ack, dig

# ubuntu
zlib1g.dev, libgdbm-dev, libssl-dev, libsqlite3-dev, libbz2-dev, libreadline-dev

# centos
c++, pcre, pcre-devel, openssl, openssl-devel, epel-release, zlib, zlib-devel, readline, readline-devel, readline-static, openssl-static, sqlite-devel, bzip2-devel, bzip2-libs
```



### 查看系统信息

```bash
$ ws os
Darwin 10.14.3 brew
# 平台名称  版本号  使用包管理工具
```

### 计算签名

计算签名，可以传入字符串或者文件名

```bash
$ ws <md5|sha1|sha256|sha512> <text|filename>
```

**例子**

```bash
$ ws md5 wxnacy             # 计算字符串
1f806eb48b670c40af49a3f764ba086f wxnacy
$ ws md5 README.md          # 计算文件
cf4b95753d3382d3560b1ad4f068db01
$ cat README.md | ws md5    # 接收管道信息
cf4b95753d3382d3560b1ad4f068db01
```

### 查看大文件

```bash
$ ws bf         # 查看当前用户下大小超过 100M 的文件
$ ws bf 1000    # 查看当前用户下大小超过 1000M 的文件
```

### 网络请求

```bash
$ ws http code https://wxnacy.com    # 查看网络请求的返回状态码
200

$ ws http time https://wxnacy.com    # 查看网络请求的耗时情况

    time_namelookup:  0.520085  # DNS 域名解析的时候，就是把网站转换成 ip 地址的过程
       time_connect:  0.527951  # TCP 连接建立的时间，就是三次握手的时间
    time_appconnect:  0.559406  # SSL/SSH 等上层协议建立连接的时间，比如 connect/handshake 的时间
      time_redirect:  0.000000  # 网址重镜像的时间
   time_pretransfer:  0.559430  # 从请求开始到响应开始传输的时间
 time_starttransfer:  0.571773  # 从请求开始到第一个字节将要传输的时间
 -----------------------------
         time_total:  0.571860  # 总时间

 0.005082  0.011133  0.028282  0.007518  0.000074
|-- DNS --|-- TCP --|-- SSL --|-- SVR --|-- DTS --|
|------------------ TOTAL 0.052110 ---------------|
```

### 时间

```bash
$ ws date       # 获取当前日期
2019-06-20

$ ws time       # 获取当前时间
21:16:19

$ ws datetime   # 获取当前日期和时间
2019-06-20 21:17:56
```

### Kindle

如果你本地配置了 mutt 邮件发送，然后安装如下方式配置好你的 Kindle 邮箱即可推送

```bash
# 配置邮箱
$ echo "email=your_kindle@kindle.cn" > ~/.config/wshell/kindle
```

```bash
$ ws kindle push <bookfile>     # 推送
```
