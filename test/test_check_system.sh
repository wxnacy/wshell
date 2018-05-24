#!/usr/bin/env bash

echo $PWD
SYS=`${PWD}/bin/system/check_system.sh`
echo $SYS
ver=`sw_vers`
echo $ver
str="aaa bbb ccc ddd"
echo $str
# arr=(${str//,/ })
arr=(${str})
echo $arr
echo ${arr[@]}
echo ${!arr[@]}
echo ${arr[0]}
echo ${arr[2]}
