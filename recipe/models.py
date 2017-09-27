from django.db import models
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone

# Create your models here.

class Category(models.Model):
	name = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.name 

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
	locality = models.CharField(max_length=100,blank=True, null=True)#ethnie du plat a ajouter peut etre
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null=True)
	author = models.ForeignKey('auth.User',related_name='recipe')
	

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
