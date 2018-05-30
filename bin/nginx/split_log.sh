#!/usr/bin/env bash

NGINX_HOME=/usr/local/openresty/nginx
LOG_DIR=${NGINX_HOME}/logs
LOG=access.log,error.log

# sudo touch ${LOG_DIR}/${LOG_API}
# sudo touch ${LOG_DIR}/${LOG_HOST}

DT=`date "+%Y%m%d-%H%M%S"`

sudo test -d ${LOG_DIR}/api || sudo mkdir ${LOG_DIR}/api
sudo test -d ${LOG_DIR}/host || sudo mkdir ${LOG_DIR}/host

# 检查日志文件是否存在
sudo test -f ${LOG_DIR}/${LOG_API} \
    && sudo mv ${LOG_DIR}/${LOG_API} ${LOG_DIR}/api/${LOG_API}.${DT}
sudo test -f ${LOG_DIR}/${LOG_HOST} \
    && sudo mv ${LOG_DIR}/${LOG_HOST} ${LOG_DIR}/host/${LOG_HOST}.${DT}

LOGS=(${LOG//,/ })
echo $LOGS

sudo ${NGINX_HOME}/sbin/nginx -s reopen
