#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description: 查找大于某个值的文件，该值默认 100M

import os

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

if __name__ == "__main__":
    import sys
    import timeit
    b = timeit.default_timer()
    args = sys.argv[1:]
    comp_size = 100     # 默认 100 M
    if len(args) >= 1:
        comp_size = int(args[0])

    COMP_SIZE = comp_size * 1024 * 1024     # 查找大于该值的文件
    home = os.getenv("HOME")
    filelists = []
    join = os.path.join
    exists = os.path.exists
    getsize = os.path.getsize
    for root, dirs, files in os.walk(home):
        for f in files:
            filepath = join(root, f)
            if exists(filepath):
                size = getsize(filepath)
                if size >= COMP_SIZE:
                    filelists.append(dict(size = size, filepath = filepath))
                    line = '{}\t{}'.format(format_size(size), filepath)
                    print(line)

    filelists.sort(key=lambda x: x['size'], reverse=True)
    print('\n排序后，最大的 10 个文件')

    for f in filelists[:10]:
        line = '{}\t{}'.format(format_size(f['size']), f['filepath'])
        print(line)
    print('\ntime used', timeit.default_timer() - b)
