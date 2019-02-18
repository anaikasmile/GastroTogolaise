#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from .models import Post, Category


from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone
from django.contrib.auth.models import User
from ckeditor.widgets import CKEditorWidget
from taggit.forms import TagWidget

class PostForm(forms.ModelForm):

	class Meta:
		model = Post
		fields = ('title', 'text', 'image', 'video', 'category','tags')
		widgets = {
			'category':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
			'title':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
			'text':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textarea','class':'form-control'}),    
			'image':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
			'video':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
        	'tags': TagWidget(attrs={'class':'form-control'}),
            }

class CategoryForm(forms.ModelForm):
	class Meta:
		model = Category
		fields = ('name',)
		widgets = {
			'name': forms.TextInput(
				attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
			'slug': forms.TextInput(
				attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
		}

