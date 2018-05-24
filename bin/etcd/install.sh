#!/usr/bin/env bash

OS=`curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/bin/system/check_system.sh | bash`
OSS=(${OS})
SYS=${OSS[0]}
VER=${OSS[1]}

if [[ $SYS == 'centos' && $VER == '6' ]]
then
    # curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/bin/etcd/install_for_centos6.sh | bash
    echo $SYS
else
    echo "暂时不支持该系统 ${OS}"
fi

