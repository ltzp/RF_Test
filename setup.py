#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/04/28
# @Author  : yuetao
# @Site    : 
# @File    : setup.py
# @Desc    :
from setuptools import setup
from setuptools import find_packages

setup(
    name='MyLibrary',
    version="1.0.0",
    description="robotframework-auto-define",
    author="yuetao",
    author_email='806518802@qq.com',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
)