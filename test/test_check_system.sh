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

OS="/Users/wxnacy/.wshell/bin/system/check"
OSS=`${OS}`
echo $OSS
# echo (${OSS})
O=(${OSS})
echo $O
