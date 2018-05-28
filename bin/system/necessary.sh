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
        sudo apt -y install patch zlib1g.dev libgdbm-dev \
            libssl-dev libsqlite3-dev libbz2-dev libreadline-dev
        sudo ${PKG} -y install dnsutils     # dig
        sudo ${PKG} -y install ack-grep     # ack

        if [[ ! $PATH =~ '/.pyenv/bin' ]];then
            curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
            echo 'export PATH="${HOME}/.pyenv/bin:$PATH"' >> ~/.profile
            echo 'eval "$(pyenv init -)"' >> ~/.profile
            echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.profile
            source ~/.profile
        fi

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
        sudo ${PKG} -y install ack      # need epel-release
        sudo ${PKG} -y install htop     # need epel-release

        if [[ ! $PATH =~ '/.pyenv/bin' ]];then
            curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
            echo 'export PATH="${HOME}/.pyenv/bin:$PATH"' >> ~/.bash_profile
            echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
            echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
            source ~/.bash_profile
        fi

    elif [ ${SYS} == 'mac' ]
    then
        echo ${SYS}

    fi
}

install
