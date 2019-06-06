#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description:

import unittest
import timeit
from size import get_size
from size import get_size1
from size import format_size

class TestMain(unittest.TestCase):

    def setUp(self):
        '''before each test function'''
        pass

    def tearDown(self):
        '''after each test function'''
        pass

    def do(self, func):
        '''todo'''
        self.assertEqual(1, 1)
        pass

    def test_func(self):
        #  self.do()
        path = '/Users/wxnacy/Documents'
        self.assertEqual(get_size(path), get_size1(path))

        self.assertEqual

    def test_format_size(self):
        self.assertEqual(format_size(234), '234.0B')
        self.assertEqual(format_size(1234), '1.2K')

def speed(count, func, *args):
    b = timeit.default_timer()
    for i in range(count):
        func(*args)
    print('{} run {} times used: {}s'.format(
        func.__name__.ljust(20), count,
        timeit.default_timer() - b
    ))


if __name__ == "__main__":
    count = 15
    path = '/Users/wxnacy/Documents'
    speed(count, get_size, path)
    speed(count, get_size1, path)


    unittest.main()
