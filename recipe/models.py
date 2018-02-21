from django.db import models
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone
from embed_video.fields import EmbedVideoField
from django_countries.fields import CountryField
#from taggit.managers import TaggableManager

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
	category = models.ForeignKey(Category,related_name='recipes')
	title = models.CharField(max_length=200)
	description = models.TextField(blank=True, null=True)
	prepare_time = models.DurationField(null=True, blank=True)
	cooking_time = models.DurationField(null=True, blank=True)
	total_time = models.DurationField(null=True, blank=True)
	ingredient = RichTextField()
	preparation = RichTextField()
	image = models.ImageField(upload_to="recipes",null=True, blank=True)
	image_1 = models.ImageField(upload_to="recipes",blank=True, null=True)
	image_2 = models.ImageField(upload_to="recipes",blank=True, null=True)
	image_3 = models.ImageField(upload_to="recipes",blank=True, null=True)
	origin = models.ManyToManyField(Origin, related_name='recipe_origin',blank=True)
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null=True)
	author = models.ForeignKey('auth.User',related_name='recipe')
	#tags = TaggableManager(blank=True, null=True)

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
	category = models.ForeignKey(Category,related_name='category_video')
	origin = models.ManyToManyField(Origin, related_name='origin_video',blank=True)
	author = models.ForeignKey('auth.User',related_name='videos')
	title = models.CharField(max_length=100)
	description = RichTextField(null=True, blank= True)
	video = EmbedVideoField()
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null= True)
	#tags = TaggableManager(blank=True, null=True)

	def publish(self):
		self.published_at = timezone.now()
		self.save()

	def __str__(self):
		return self.title