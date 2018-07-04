#!/usr/bin/env bash

NGINX_HOME=/usr/local/openresty/nginx
LOG=access.log,error.log
LOG_DIR=${NGINX_HOME}/logs


DT=`date "+%Y%m%d-%H%M%S"`

LOGS=(${LOG//,/ })
echo ${LOGS[@]}

for f in ${LOGS[@]};do
    dir=${LOG_DIR}/${f//./_}
    test -d $dir || sudo mkdir -p $dir
    test -f ${LOG_DIR}/$f && sudo mv ${LOG_DIR}/$f ${dir}/$f.${DT}
done

sudo ${NGINX_HOME}/sbin/nginx -s reopen
