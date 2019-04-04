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
$ echo '. ${WS_HOME}/conf/system/bashrc' >> ~/.bashrc
$ source ~/.bashrc
```

**查看版本**

```bash
$ ws version
```

**更新**

```bash
$ ws update
```


## 语法

```bash
$ ws[hell] <command> [args...]
```

## 参数
### install

一键下载软件，如

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

### update

更新 Wshell 到最新版

### check

查看 Wshell 支持软件的安装情况

### os

查看系统版本信息

```bash
$ ws os
Darwin 10.14.3 brew
# 平台名称  版本号  使用包管理工具
```

### hash

计算 hash 值，可以传入字符串或者文件名

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
