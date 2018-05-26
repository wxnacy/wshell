#!/usr/bin/env bash

OS=`curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/bin/system/check_system.sh | bash`
OSS=(${OS})
SYS=${OSS[0]}
VER=${OSS[1]}


install(){
    if [ ${SYS} == 'ubuntu' ]
    then
        sudo apt-get -y update
        sudo apt -y install patch zlib1g.dev libgdbm-dev \
            libssl-dev libsqlite3-dev libbz2-dev libreadline-dev
        wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
        sudo apt-get -y install software-properties-common
        sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
        sudo apt-get -y update
        sudo apt-get -y install openresty

    elif [ ${SYS} == 'centos' ]
    then
        sudo ${PKG} -y install pcre pcre-devel openssl openssl-devel
        sudo yum -y install yum-utils
        sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
        sudo yum -y install openresty

    elif [ ${SYS} == 'mac' ]
    then
        echo ${SYS}

    fi
}

install
