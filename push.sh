#!/usr/bin/env bash

MSG=$1

cp bin/wshell.sh bin/wshell

git pull && git add . && git commit -m "${MSG}" && git push origin master
