#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone
from django.conf import settings
from django.utils.encoding import python_2_unicode_compatible

@python_2_unicode_compatible
class Category(models.Model):
	name = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	slug = models.SlugField(null=False,unique=True)

	def __str__(self):
		return self.name 


@python_2_unicode_compatible
class Restaurant(models.Model):
	ENABLED = (
        ('True', _(u'Oui')),
        ('False', _(u'Non')),
    )

	category = models.ForeignKey(Category,related_name='addresses',verbose_name="Catégorie")
	author = models.ForeignKey(settings.AUTH_USER_MODEL)
	name = models.CharField(max_length=200,verbose_name="Nom")
	description =   RichTextField(null=True, blank=True)
	tel = models.CharField(max_length=50,null=True, blank=True)
	fb_id = models.CharField(max_length=50,null=True, blank=True,help_text="togokuizine",verbose_name = "Facebook ID")
	insta_id = models.CharField(max_length=50,null=True, blank=True,help_text="tg_kuizine",verbose_name = "Instagram ID")
	twit_id = models.CharField(max_length=50,null=True, blank=True,help_text="togokuizine",verbose_name = "Twitter ID")
	lind_id = models.CharField(max_length=50,null=True, blank=True,help_text="togokuizine",verbose_name = "Linkedin ID")
	address = models.CharField(max_length=200,null=True, blank=True)
	web_site = models.CharField(max_length=100,null=True, blank=True,verbose_name="Site web")
	image = models.ImageField(upload_to="restaurants",null=True, blank=True)
	enabled = models.CharField(max_length=5, choices=ENABLED, default='False')
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	slug = models.SlugField(null=False,unique=True)

	def publish(self):
		self.enabled = "True"
		self.save()

	def __str__(self):
		return self.name 