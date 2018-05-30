#!/usr/bin/env bash

MSG=$1

cp bin/shell.sh bin/shell

git pull && git add . && git commit -m "${MSG}" && git push origin master
