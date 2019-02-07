## 自建 SS 服务器自动脚本

以 [自建ss服务器教程](https://github.com/Alvin9999/new-pac/wiki/%E8%87%AA%E5%BB%BAss%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%95%99%E7%A8%8B) 为教程，使用 expect 编写了自动部署脚本。

直接安装

```bash
$ wget -N --no-check-certificate https://raw.githubusercontent.com/wxnacy/wshell/master/bin/ssr/centos_install_ssr
$ bash centos_install_ssr
```

执行完后服务器自动重启，稍后登陆执行命令，完成锐速加速

```bash
$ bash serverspeeder-all.sh
```

或者使用 [wshell](https://github.com/wxnacy/wshell) 进行安装


原理：
- 选用 CentOS6 系统
- 安装 SSR 客户端
- 使用锐速加速器

使用 vultr 购买 CentOS 6 服务器，教程有很详细的讲解，不再赘述。

## 安装 SSR

```bash
$ sudo yum install -y wget expect
$ wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh
```

创建自动部署脚本 `install_ssr`

```expect
#!/usr/bin/env expect

spawn sh -c "bash ssr.sh"
expect "*1-15*"
# 安装
send "1\r"
expect "(默认: 2333):"
send "\r"
expect "(默认: doub.io)"
send "\r"
expect "(默认: 5. aes-128-ctr):"
send "10\r"
expect "(默认: 2. auth_sha1_v4):"
send "\r"
expect "*Y*n"
send "y\r"
expect "(默认: 1. plain):"
send "\r"
expect "(默认: 无限):"
send "\r"
expect "(默认: 无限):"
send "\r"
expect "(默认: 无限):"
send "\r"
expect "*y*N*"
send "y\r"
expect "*y*N*"
send "y\r"
interact
```

使用 expect 运行脚本

```bash
$ chmod +x install_ssr
$ expect install_ssr
```

随后会使用教程使用的默认参数进行自动安装

## 安装锐速

```bash
$ wget --no-check-certificate https://blog.asuhu.com/sh/ruisu.sh
$ wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh
$ bash ruisu.sh
```

执行时间会有点长，完毕后机器会自动重启，稍后登陆在进行加速操作

```bash
$ bash serverspeeder-all.sh
```
