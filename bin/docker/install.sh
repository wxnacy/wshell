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
    fi

    if [ $SYS == 'centos' ]
    then
        if [ $VER == '7' ];then
            install_centos7
        fi
    fi

    if [ $SYS == 'amzn' ];then
        if [ $VER == '2' ];then
            install_amzn2
        fi
    fi
}

install_amzn2(){
    sudo yum remove docker docker-ce \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

    sudo yum install -y --setopt=obsoletes=0 \
        docker-ce-17.03.1.ce-1.el7.centos \
        docker-ce-selinux-17.03.1.ce-1.el7.centos
    sudo systemctl start docker
    sudo systemctl enable docker
}

install_centos7(){
    sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    sudo yum-config-manager --add-repo \ 
        https://download.docker.com/linux/centos/docker-ce.repo
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
