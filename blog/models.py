from django.db import models
from django.utils import timezone
from sorl.thumbnail import ImageField
from ckeditor.fields import RichTextField
from embed_video.fields import EmbedVideoField
# Create your models here.


class Category(models.Model):
	name = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.name 


class Post(models.Model):
	category = models.ForeignKey(Category,related_name='posts')
	author = models.ForeignKey('auth.User')
	title =  models.CharField(max_length=200)
	text =   RichTextField()
	image = models.ImageField(blank=True, null= True,upload_to="blog")
	video = EmbedVideoField(blank=True, null= True)
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(default=timezone.now)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null= True)

	def publish(self):
		self.published_at = timezone.now()
		self.save()
		
	def __str__(self):
		return self.title

# class Comment(models.Model):
# 	post = models.ForeignKey(Post, related_name='comments')
# 	author = models.CharField(max_length=25)
# 	text = models.TextField()
# 	created_at = models.DateTimeField(default=timezone.now)
# 	approved_comment = models.BooleanField(default=False)

# 	def approve(self):
# 		self.approved_comment = True
# 		self.save()

# 	def approved_comments(self):
# 		return self.comments.filter(approved_comment=True)

# 	def __str__(self):
# 		return self.text 