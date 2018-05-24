#!/usr/bin/env bash

sudo yum update -y
sudo yum install -y wget

VERSION=3.3.5
ETCD_FILENAME=etcd-v${VERSION}-linux-amd64.tar.gz
ETCD_DIR=etcd-v${VERSION}-linux-amd64

test -f ${ETCD_FILENAME} || wget https://github.com/coreos/etcd/releases/download/v${VERSION}/${ETCD_FILENAME}
test -d {ETCD_FILENAME} || tar -zxvf ${ETCD_FILENAME}
test -f /usr/bin/etcd || sudo cp ${ETCD_DIR}/etcd /usr/bin/etcd
test -f /usr/bin/etcdctl || sudo cp ${ETCD_DIR}/etcdctl /usr/bin/etcdctl

cat <<EOF | sudo tee /etc/sysconfig/etcd.conf
ETCD_LOG_DIR=/var/log/etcd
ETCD_CONFIG=/etc/etcd.yml
EOF


cat <<EOF | sudo tee /etc/etcd.yml
name: "api"
data-dir: /var/lib/etcd
listen-client-urls: http://0.0.0.0:2379
EOF

test -d /var/lib/etcd || sudo mkdir /var/lib/etcd

sudo curl  https://raw.githubusercontent.com/wxnacy/wxnacy.github.io/master/shells/linux/etcd.initd -o /etc/init.d/etcd
sudo chmod +x /etc/init.d/etcd

sudo chkconfig --add etcd
sudo chkconfig etcd on
