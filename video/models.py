from django.db import models
from django.utils import timezone
from ckeditor.fields import RichTextField
from embed_video.fields import EmbedVideoField

class Video(models.Model):
	author = models.ForeignKey('auth.User')
	title = models.CharField(max_length=100)
	# description = RichTextField(null=True, blank= True)
	video = EmbedVideoField()
	view = models.IntegerField(default=0,null=True, blank= True)
	like = models.IntegerField(default=0,null=True, blank= True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)
	published_at = models.DateTimeField(blank=True, null= True)

	def publish(self):
		self.published_at = timezone.now()
		self.save()

	def __str__(self):
		return self.title