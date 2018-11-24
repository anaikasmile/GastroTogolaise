#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin

# Register your models here.
# Register your models here.
from blog.models import Post, Category
admin.site.register(Category)
admin.site.register(Post)
