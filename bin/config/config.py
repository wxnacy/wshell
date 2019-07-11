#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description: 解析文件名

import configparser
import os

CONFIG_PATH='{}/.config/wshell/config'.format(os.getenv("HOME"))

conf = configparser.ConfigParser()
conf.read(CONFIG_PATH)

def set_val(name, value):
    sec = name.split('.')[0]
    key = name.split('.')[1]
    if sec not in conf:
        conf[sec] = {}
    conf[sec][key] = value
    with open(CONFIG_PATH, 'w') as f:
        conf.write(f)
        f.close()

def delete(name):
    sec = name.split('.')[0]
    key = name.split('.')[1]
    if sec in conf and key in conf[sec]:
        del conf[sec][key]
    with open(CONFIG_PATH, 'w') as f:
        conf.write(f)
        f.close()

def get_val(name):
    sec = name.split('.')[0]
    key = name.split('.')[1]
    if sec in conf and key in conf[sec]:
        print(conf[sec][key])



if __name__ == "__main__":
    import sys
    args = sys.argv[1:]
    cmd = args[0]

    cmdswitch = {
        "set": set_val,
        "del": delete,
        "get": get_val,
    }

    cmdswitch[cmd](*args[1:])

