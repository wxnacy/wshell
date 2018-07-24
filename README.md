# Wshell

Wshell 是集成化的 Linux 服务器脚本，主旨是尽量将常用软件的复杂安装过程和操作一键化，提高工作效率。

**适配**
- Ubuntu
- CentOS


## 安装

**安装最新版**

curl

```bash
$ curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/install | bash
```

wget

```bash
$ wget -qO- https://raw.githubusercontent.com/wxnacy/wshell/master/install | bash
```

<!-- **安装指定版本** -->
<!-- ```bash -->
<!-- $ curl -L https://raw.githubusercontent.com/wxnacy/wshell/${tag_name}/install | bash -->
<!-- ``` -->

**配置环境**

```bash
$ vim ~/.bash_profile
```

```bash
export PATH="${HOME}/.wshell/bin:$PATH"
. ${HOME}/.wshell/bin/conf/.bash_profile
```

```bash
$ source ~/.bash_profile
```

## 使用

```bash
$ wshell <command> [args...]
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
- `nvm` 0.33.11
- `es, elasticsearch` Elasticsearch 6.x 最新版
- `pyenv`
- `ack`
- `dig`
- `htop`
- `http` httpie
- `wvim`
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
