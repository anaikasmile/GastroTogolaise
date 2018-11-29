#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils import timezone
from sorl.thumbnail import ImageField
from ckeditor.fields import RichTextField
from embed_video.fields import EmbedVideoField
from taggit.managers import TaggableManager
from django.conf import settings
from django.utils.encoding import python_2_unicode_compatible

# Create your models here.

@python_2_unicode_compatible
class Category(models.Model):
	name = models.CharField(max_length=50,verbose_name="Nom *")
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	slug = models.SlugField(null=False,unique=True,verbose_name="Slug *")

	def __str__(self):
		return self.name 

@python_2_unicode_compatible
class Post(models.Model):
	category = models.ForeignKey(Category,related_name='posts',verbose_name="Categorie")
	author = models.ForeignKey(settings.AUTH_USER_MODEL)
	title = models.CharField(max_length=200,verbose_name="Titre")
	text = RichTextField(verbose_name="Description")
	image = models.ImageField(blank=True, null= True,upload_to="blog")
	video = EmbedVideoField(blank=True, null= True)
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(default=timezone.now)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null= True)
	tags = TaggableManager()
	slug = models.SlugField(null=False,unique=True)

	def publish(self):
		self.published_at = timezone.now()
		self.save()
		
	def __str__(self):
		return self.title