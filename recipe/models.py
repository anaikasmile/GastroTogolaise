#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone
from embed_video.fields import EmbedVideoField
from django_countries.fields import CountryField
from taggit.managers import TaggableManager
from django.conf import settings
from django.utils.encoding import python_2_unicode_compatible

#from bootstrap3_datetime.widgets import DateTimePicker
# Create your models here.

@python_2_unicode_compatible
class Category(models.Model):
	name = models.CharField(max_length=50,verbose_name="Nom *")
	created_at = models.DateTimeField(auto_now_add=True, verbose_name="Créé le")
	update_at = models.DateTimeField(auto_now=True, verbose_name="Modifié le")
	slug = models.SlugField(null=False,unique=True, verbose_name="Slug *")

	def __str__(self):
		return self.name 


@python_2_unicode_compatible
class Origin(models.Model):
	ethnic = models.CharField(max_length=200, verbose_name="Région *")
	country = CountryField(blank_label=('Choisissez le pays'),blank=True, null=True, verbose_name="Pays *")
	created_at = models.DateTimeField(auto_now_add=True, verbose_name="Créé le")
	update_at = models.DateTimeField(auto_now=True,verbose_name="Modifié le")

	def __str__(self):
		return self.ethnic



@python_2_unicode_compatible
class Recipe(models.Model):
	category = models.ForeignKey(Category,related_name='recipes',verbose_name="Catégorie *")
	title = models.CharField(max_length=200,verbose_name="Nom de la recette *", help_text="Choisissez un titre explicite (Soyez créatif)")
	description = models.TextField(blank=True, null=True,verbose_name="Description", help_text="Pas plus de 500 mots")
	prepare_time = models.DurationField(null=True, blank=True,verbose_name="Temps de préparation", help_text="hh:mm")
	cooking_time = models.DurationField(null=True, blank=True, verbose_name="Temps de cuisson",help_text="hh:mm")
	total_time = models.DurationField(null=True, blank=True, verbose_name="Prêt dans")
	ingredient = RichTextField(verbose_name="Ingrédients *", help_text="Utilisez les listes à puces (.) pour lister les ingrédients les uns au dessous des autres")
	preparation = RichTextField(verbose_name="Instructions *",help_text="Utilisez les listes numérotées  (1,2) pour décrire chaque étape")
	image = models.ImageField(upload_to="recipes",blank=True, verbose_name="Image principale*")
	image_1 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Image 1")
	image_2 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Image 2")
	image_3 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Image 3")
	image_4 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Image 4")
	image_5 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Image 5")

	origin = models.ManyToManyField(Origin, related_name='origines',blank=True,verbose_name="Origine de la recette", help_text="D'où vient la recette?")
	view = models.IntegerField(default=0,null=True, blank= True,verbose_name="Vue")
	like = models.IntegerField(default=0,null=True, blank= True,verbose_name="Like")
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null=True)
	author = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='recipe')
	tags = TaggableManager(verbose_name="Tags *")
	slug = models.SlugField(null=False,unique=True)

	# def view(self):
	# 	self.view = self.view+1 
	# 	self.save()

	def readytime(self):
		if (self.prepare_time or self.cooking_time):
			self.total_time = self.prepare_time + self.cooking_time
			self.save()

	def publish(self):
		self.published_at = timezone.now()
		self.save()

	def __str__(self):
		return self.title

@python_2_unicode_compatible
class RecipeLike(models.Model):
    recipe = models.ForeignKey(Recipe, blank=False, null=False)
    ip = models.GenericIPAddressField(blank=False, null=False)

    class Meta:
        unique_together = ('recipe', 'ip')

    def __str__(self):
        return self.recipe.title


@python_2_unicode_compatible
class CategoryVideo(models.Model):
	name = models.CharField(max_length=50,verbose_name="Nom *")
	created_at = models.DateTimeField(auto_now_add=True, verbose_name="Créé le")
	update_at = models.DateTimeField(auto_now=True, verbose_name="Modifié le")
	slug = models.SlugField(null=False,unique=True, verbose_name="Slug *")

	def __str__(self):
	
		return self.name 

@python_2_unicode_compatible
class Video(models.Model):

	category = models.ForeignKey(CategoryVideo,related_name='category_video', verbose_name="Catégorie", blank=True, null=True)
	origin = models.ManyToManyField(Origin, related_name='origin_video',blank=True,verbose_name="Origine de la recette")
	author = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='videos')
	title = models.CharField(max_length=100, verbose_name="Titre")
	description = RichTextField(null=True, blank= True)
	video = EmbedVideoField()
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null= True)
	tags = TaggableManager(verbose_name="Tags *")
	slug = models.SlugField(null=False,unique=True)
	

	def publish(self):
		self.published_at = timezone.now()
		self.save()

	def __str__(self):
		return self.title

@python_2_unicode_compatible
class VideoLike(models.Model):
    video = models.ForeignKey(Video, blank=False, null=False)
    ip = models.GenericIPAddressField(blank=False, null=False)

    class Meta:
        unique_together = ('video', 'ip')

    def __str__(self):
        return self.video.title