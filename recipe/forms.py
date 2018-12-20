#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django import forms
from django.forms import modelformset_factory

from .models import Recipe, Video, Origin, Category, CategoryVideo
from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone
from django.contrib.auth.models import User
from datetimepicker.widgets import DateTimePicker
from taggit.forms import TagWidget
from django_select2.forms import Select2MultipleWidget, ModelSelect2TagWidget
from django.utils.text import slugify
from django_addanother.contrib.select2 import Select2MultipleAddAnother
from django.core.urlresolvers import reverse_lazy

class RecipeForm(forms.ModelForm):
    class Meta:
        model = Recipe
        fields = ['category','title','origin','description','prepare_time','cooking_time','ingredient','preparation','image','image_1','image_2','image_3','tags']
        widgets = {
            'category':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            #'origin': forms.SelectMultiple(attrs={'name':'','id':'','class':'js-example-placeholder-multiple js-states form-control'}),
            'origin': Select2MultipleAddAnother(reverse_lazy('origin_add')),
            'title':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'description':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),
            'cooking_time': forms.TimeInput(attrs={'type':'time','placeholder':_(u''),'name':'','id':'settime','class':'form-control'}),
            'prepare_time': forms.TimeInput(attrs={'type':'time','placeholder':_(u''),'name':'','id':'settime2','class':'form-control'}),
            'ingredient':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'preparation':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            
            'image':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'image_1':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'image_2':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'image_3':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'tags': TagWidget(attrs={'class':'form-control'})
            }

    

class OriginForm(forms.ModelForm):
    class Meta:
        model = Origin
        fields = ['ethnic','country']
        widgets = {
            'country':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'ethnic':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            
            }   

# RecipeFormSet = inlineformset_factory(Origin, Recipe,
#                                             form=RecipeForm, extra=1)
OriginFormset = modelformset_factory(
    Origin,
    fields=('ethnic',),
    extra=1,
    widgets={
        'ethnic': forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Une autre ethnie'
            }
        ),

    }
)

class VideoForm(forms.ModelForm):

    class Meta:
        model = Video
        fields = ('title', 'video','description','category','origin','tags')
        widgets = {
            'category':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'origin':forms.SelectMultiple(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'title':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'description':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),
            'video':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'tags': TagWidget(attrs={'class':'form-control'})
            }

#ajout 07/06/18
class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ('name', 'slug')
        widgets = {
            'name': forms.TextInput(
                attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
            'slug': forms.TextInput(
                attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
        }

class CategoryVideoForm(forms.ModelForm):
    class Meta:
        model = CategoryVideo
        fields = ('name', 'slug')
        widgets = {
            'name': forms.TextInput(
                attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
            'slug': forms.TextInput(
                attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
        }

# fin ajout

