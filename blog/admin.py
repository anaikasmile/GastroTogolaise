#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin

# Register your models here.
# Register your models here.
from blog.models import Post, Category, PostLike
from django import forms

from ckeditor.widgets import CKEditorWidget

class PostAdminForm(forms.ModelForm):
    text = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Post
        fields = '__all__'

class PostAdmin(admin.ModelAdmin):
    form = PostAdminForm

    
admin.site.register(Category)
admin.site.register(Post)
admin.site.register(PostLike)
