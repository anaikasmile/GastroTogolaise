#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin

# Register your models here.
from userprofile.models import Profile, User

admin.site.register(Profile)
admin.site.register(User)