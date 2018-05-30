#!/usr/bin/env bash

echo $@
# echo $PWD
# SYS=`${PWD}/bin/system/check_system.sh`
# echo $SYS
# ver=`sw_vers`
# echo $ver
str="aaa bbb ccc ddd"
# echo $str
# arr=(${str//,/ })
arr=(${str})
echo $arr
echo ${arr[@]}
echo ${!arr[@]}
echo ${arr[0]}
echo ${arr[2]}

# OS=`curl -L https://raw.githubusercontent.com/wxnacy/wshell/master/bin/system/check_system.sh | bash`
# OSS=(${OS})
# SYS=${OSS[0]}
# VER=${OSS[1]}

# echo $SYS
# echo $VER

# echo $PATH
# if [[ ! $PATH =~ '/usr/local/phantomjs/bin' ]];then
    # echo 'yes'
# else
    # echo 'no'
# fi

if which git > /dev/null;then
    echo 'has'
fi
