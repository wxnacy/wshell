#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description:

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
    module = sys.modules[__name__]
    args = sys.argv[1:]
    func_name = args[0]
    func = getattr(module, func_name)
    res = func(int(args[1]))
    print(res)

