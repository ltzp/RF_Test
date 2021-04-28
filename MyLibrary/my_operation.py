#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/04/28
# @Author  : yuetao
# @Site    : 
# @File    : my_operation.py
# @Desc    :
from robot.api import deco

class MyOperation(object):

    @deco.keyword('add')
    def add(self, x, y):
        return x + y

    @deco.keyword('subtraction')
    def subtraction(self, x, y):
        return x - y