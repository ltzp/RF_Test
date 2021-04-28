#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/04/28
# @Author  : yuetao
# @Site    : 
# @File    : __init__.py
# @Desc    :
from .my_operation import MyOperation
from .version import VERSION

class MyLibrary(MyOperation):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = VERSION
