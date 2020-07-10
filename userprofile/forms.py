#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django import forms
from .models import Profile , User

from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _
from allauth.account.forms import ChangePasswordForm, PasswordVerificationMixin, LoginForm, SignupForm


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


class ChangePasswordForm(ChangePasswordForm):
    oldpassword = forms.CharField(required=False, widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Mot de passe actuel'}))
    password1 = forms.CharField(required=True, widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder':'Nouveau mot de passe'}))
    password2 = forms.CharField(required=True, widget=forms.PasswordInput(attrs={'class': 'form-control','placeholder':'Nouveau mot de passe (encore)'}))

    def clean(self):
        cleaned_data = super(PasswordVerificationMixin, self).clean()
        password1 = cleaned_data.get('password1')
        password2 = cleaned_data.get('password2')
        if (password1 and password2) and password1 != password2:
            self.add_error(
                'password2', _("Répétez le même mot de passe.")
            )
        return cleaned_data

    def clean_oldpassword(self):
        if not self.user.check_password(self.cleaned_data.get("oldpassword")):
            raise forms.ValidationError(_("Veuillez saisir votre mot de passe actuel"))

        return self.cleaned_data["oldpassword"]


class LoginForm(LoginForm):

    error_messages = {
        'account_inactive':
        _("Votre compte a été désactivé. Contactez l'admin"),

        'email_password_mismatch':
        _("E-mail address et/ou mot de passe incorrects."),

        'username_password_mismatch':
        _("Nom d'utilisateur et/ou mot de passe incorrects"),
    }


