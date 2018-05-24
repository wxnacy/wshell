#!/usr/bin/env bash

MSG=$1

git pull && git add . && git commit -m "${MSG}" && git push origin master
