#!/usr/bin/env bash

OS=`curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/bin/system/check_system.sh | bash`
OSS=(${OS})
SYS=${OSS[0]}
VER=${OSS[1]}


install(){
    if [ ${SYS} == 'ubuntu' ]
    then
        if [ ${VER} == '14.04' ]
        then
            install_ubuntu1404
        elif [ ${VER} == '16.04' ]
        then
            install_ubuntu1604
        fi
    elif [[ ${SYS} == 'centos' && ${VER} == '7']];then
        install_centos7
    elif [ ${SYS} == 'mac' ]
    then
        echo ${SYS}

    fi
}


install_centos7(){
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce
    sudo systemctl start docker
    sudo systemctl enable docker
}

install_ubuntu1604(){
    sudo apt-get -y update
    sudo apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get -y update
    sudo apt-get -y install docker-ce
}

install_ubuntu1404(){
    sudo apt-get -y update
    sudo apt-get -y install  linux-image-extra-$(uname -r) linux-image-extra-virtual
    sudo apt-get -y update
    sudo apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get -y update
    sudo apt-get -y install docker-ce
}

install
