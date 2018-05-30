#!/usr/bin/env bash

MSG=$*

git pull && git add . && git commit -m "${MSG}" && git push origin master
