#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description: 解析文件名

import os

def parse(filename):
    filedir, name = os.path.split(filename)
    names = name.split(".")
    result = [filedir or '.', name]
    result.extend(names)
    return result

if __name__ == "__main__":
    import sys
    filename = sys.argv[1]
    #  filename = '~/Downloads/人间失格/人间失格.mobi'
    #  filename = '~/Downloads/人间失格/'
    a, b, c, d = parse(filename)
    print(a, b, c, d)



