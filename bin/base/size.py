#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description:

import os


def get_size(path):
    '''获取文件的大小'''
    def _size(p, s: int):
        if os.path.isfile(p):
            s += os.path.getsize(p)
            #  print(s, os.path.getsize(p), p)
        else:
            files = os.listdir(p)
            for f in files:
                fp = '{}/{}'.format(p, f)
                s = _size(fp, s)
        return s
    res = _size(path, 0)
    #  print(res)
    return res

def get_size1(path):
    '''获取文件的大小'''
    if os.path.isfile(path):
        return os.path.getsize(path)

    size = 0
    for root, dirs, filenames in os.walk(path):
        for filename in filenames:
            filepath = '{}/{}'.format(root, filename)
            size += os.path.getsize(filepath)
    return size

def format_size(size: int):
    '''格式化大小'''
    unit = {
        0: 'B',
        1: 'K',
        2: 'M',
        3: 'G',
        4: 'T',
    }

    for i in range(6):
        if 1024 ** i <= size < 1024 ** ( i + 1 ):
            if i > 0:
                size = size / 1024 ** i
            return '{:0.1f}{}'.format( size, unit[i])
    return '{}B'.format(size)

class File():
    def __init__(self, path, *args, **kwargs):
        self.path = path

if __name__ == "__main__":
    import sys
    args = sys.argv[1:]
    path = '.'
    is_fmt = False
    for a in args:
        if not a.startswith('-') and a:
            path = a
        if a == '-h':
            is_fmt = True

    #  if len(args) >=1:
        #  path = args[0]

    #  print(path)

    lists = []

    total_size = 0
    if os.path.isfile(path):
        print(os.path.getsize(path))
        sys.exit(0)
    files = os.listdir(path)
    for f in files:
        filepath = '{}/{}'.format(path, f)
        size = get_size(filepath)
        total_size += size
        fmt_size = format_size(size) if is_fmt else size
        line = '{}\t\t{}'.format(fmt_size, f)
        print(line)
        lists.append(dict(size= size, name = f))
    fmt_total = format_size(total_size) if is_fmt else total_size
    print('Total:', fmt_total)
    print('开始排序')

    lists.sort(key = lambda o: o['size'], reverse=True)
    for l in lists[0:10]:
        size = l['size']
        f = l['name']
        fmt_size = format_size(size) if is_fmt else size
        line = '{}\t\t{}'.format(fmt_size, f)
        print(line)


