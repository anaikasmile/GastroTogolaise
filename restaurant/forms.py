#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from .models import Restaurant, Category
from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone

class RestaurantForm(forms.ModelForm):
    class Meta:
        model = Restaurant
        fields = ['category','name','description','tel','address','web_site','image','enabled','fb_id','insta_id','twit_id','lind_id']
        widgets = {
            'category':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'name':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'description':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),
            'tel':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'address':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),        
            'web_site':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'fb_id':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'insta_id':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'twit_id':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'lind_id':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'enabled':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),      
            'image':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}), 
            
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