#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from .models import Profile , User

from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')
        widgets = {
            'first_name':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'last_name':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'email':forms.TextInput(attrs={'placeholder':_(u'Email'),'name':'','id':'','class':'form-control'}),
              }

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('bio', 'country','tel', 'photo','facebook','twitter','linkedin','gplus','instagram','job')
        widgets = {
            'bio':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),
            'country':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'tel':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'facebook':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
           	'twitter':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'linkedin':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
           	'gplus':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'instagram':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'photo':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'job':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),

            }


class AdminForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'username', 'password')
        widgets = {
            'first_name':forms.TextInput(attrs={'placeholder':_(u'Prénoms'),'name':'','id':'','class':'form-control'}),
            'last_name':forms.Textarea(attrs={'placeholder':_(u'Nom'),'name':'','id':'','class':'form-control'}),
            'username':forms.TextInput(attrs={'placeholder':_(u'Username'),'name':'','id':'','class':'form-control'}),
            'email':forms.TextInput(attrs={'placeholder':_(u'Email'),'name':'','id':'','class':'form-control'}),
            'password':forms.PasswordInput(attrs={'placeholder':_(u'Mot de passe'),'name':'','id':'','class':'form-control'}),
          	
              }


#ajout 06/06/18

class ConnexionAdminForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username', 'password')
        widgets = {
            'username': forms.TextInput(attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
            'password': forms.TextInput(attrs={'placeholder': _(u''), 'name': '', 'id': '', 'class': 'form-control'}),
        }

# fin ajout
