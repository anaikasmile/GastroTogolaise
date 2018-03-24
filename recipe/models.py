from django.db import models
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone
from embed_video.fields import EmbedVideoField
from django_countries.fields import CountryField
from taggit.managers import TaggableManager
from django.conf import settings
#from bootstrap3_datetime.widgets import DateTimePicker
# Create your models here.

class Category(models.Model):
	name = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.name 


class Origin(models.Model):
	ethnic = models.CharField(max_length=200)
	country = CountryField(blank_label=('select country'))
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.ethnic

class Recipe(models.Model):
	category = models.ForeignKey(Category,related_name='recipes',verbose_name="Catégorie")
	title = models.CharField(max_length=200,verbose_name="Nom de la recette")
	description = models.TextField(blank=True, null=True,verbose_name="Description")
	prepare_time = models.DurationField(null=True, blank=True,verbose_name="Temps de préparation")
	cooking_time = models.DurationField(null=True, blank=True, verbose_name="Temps de cuisson")
	total_time = models.DurationField(null=True, blank=True, verbose_name="Prêt dans")
	ingredient = RichTextField(verbose_name="Ingrédients")
	preparation = RichTextField(verbose_name="Instructions")
	image = models.ImageField(upload_to="recipes",null=True, blank=True,verbose_name="Image")
	image_1 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Autre image")
	image_2 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Autre image")
	image_3 = models.ImageField(upload_to="recipes",blank=True, null=True,verbose_name="Autre image")
	origin = models.ManyToManyField(Origin, related_name='origines',blank=True,verbose_name="Origine de la recette")
	view = models.IntegerField(default=0,null=True, blank= True,verbose_name="Vue")
	like = models.IntegerField(default=0,null=True, blank= True,verbose_name="Like")
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null=True)
	author = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='recipe')
	tags = TaggableManager()

	# def view(self):
	# 	self.view = self.view+1 
	# 	self.save()

	def readytime(self):
		self.total_time = self.prepare_time + self.cooking_time
		self.save()

	def publish(self):
		self.published_at = timezone.now()
		self.save()

	def __str__(self):
		return self.title


class Video(models.Model):
	category = models.ForeignKey(Category,related_name='category_video', verbose_name="Catégorie")
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
	tags = TaggableManager()
	#tags = TaggableManager(blank=True, null=True)

	def publish(self):
		self.published_at = timezone.now()
		self.save()

	def __str__(self):
		return self.title