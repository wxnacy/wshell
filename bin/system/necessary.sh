#!/usr/bin/env bash

OS=`curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/bin/system/check_system.sh | bash`
OSS=(${OS})
SYS=${OSS[0]}
VER=${OSS[1]}

PKG=yum
if [ $SYS == 'ubuntu' ];then
    PKG=apt
fi

install(){
    sudo ${PKG} -y update
    sudo ${PKG} -y install gcc g++ make cmake
    sudo ${PKG} -y install git vim wget unzip
    if [ ${SYS} == 'ubuntu' ]
    then
        sudo ${PKG} -y install htop python-pip
        sudo pip install httpie
        sudo ${PKG} -y install patch zlib1g.dev libgdbm-dev \
            libssl-dev libsqlite3-dev libbz2-dev libreadline-dev
        sudo ${PKG} -y install dnsutils     # dig
        sudo ${PKG} -y install ack-grep     # ack
    elif [ ${SYS} == 'centos' ]
    then
        sudo ${PKG} -y install gcc-c++ aclocal
        sudo ${PKG} -y install pcre pcre-devel openssl openssl-devel # nginx
        sudo ${PKG} -y install epel-release htop # htop need
        sudo ${PKG} -y install install zlib zlib-devel  # GeoIp need
        sudo ${PKG} -y install install bind-utils       # dig

        sudo ${PKG} -y install readline readline-devel readline-static \
            openssl-static sqlite-devel bzip2-devel bzip2-libs
        # https://beyondgrep.com/install/
        # sudo /bin/bash -c "curl https://beyondgrep.com/ack-2.22-single-file > /bin/ack && chmod 0755 /bin/ack"
        sudo ${PKG} -y install ack
        sudo ${PKG} -y install htop
    elif [ ${SYS} == 'mac' ]
    then
        echo ${SYS}

    fi
}

install
