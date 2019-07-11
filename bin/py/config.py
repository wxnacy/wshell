#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description: 解析文件名

import configparser
import os
import reprlib

CONFIG_PATH='{}/.config/wshell/config'.format(os.getenv("HOME"))

#  conf = configparser.ConfigParser()
#  conf.read(CONFIG_PATH)

#  def set_val(name, value):
    #  sec = name.split('.')[0]
    #  key = name.split('.')[1]
    #  if sec not in conf:
        #  conf[sec] = {}
    #  conf[sec][key] = value
    #  with open(CONFIG_PATH, 'w') as f:
        #  conf.write(f)
        #  f.close()

#  def delete(name):
    #  sec = name.split('.')[0]
    #  key = name.split('.')[1]
    #  if sec in conf and key in conf[sec]:
        #  del conf[sec][key]
    #  with open(CONFIG_PATH, 'w') as f:
        #  conf.write(f)
        #  f.close()

#  def get_val(name):
    #  sec = name.split('.')[0]
    #  key = name.split('.')[1]
    #  if sec in conf and key in conf[sec]:
        #  print(conf[sec][key])

class ConfigParser():
    def __init__(self, *filenames):
        self._conf = configparser.ConfigParser()
        self._conf.read(filenames)

    def read(self, *conf_path):
        self._conf.read(conf_path)

    def __getattr__(self, name):
        if name in self._conf.sections():
            return self.Section(self._conf[name])
        return self.Section()

    class Section(dict):
        def __init__(self, sec={}):
            super().__init__(sec)
            #  self.sec = sec
            #  self = sec

        def __getattr__(self, name):
            return self.get(name)

        def __repr__(self):
            return '<ConfigParser.Section keys={}>'.format(
                reprlib.repr(list(self.keys())))

ws_conf = ConfigParser(CONFIG_PATH)

