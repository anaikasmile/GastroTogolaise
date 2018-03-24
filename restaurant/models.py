from django.db import models
from django.utils.translation import ugettext_lazy as _
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone
from django.conf import settings


class Category(models.Model):
	name = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.name 

class Restaurant(models.Model):
	ENABLED = (
        ('True', _(u'True')),
        ('False', _(u'False')),
    )

	category = models.ForeignKey(Category,related_name='addresses',verbose_name="Catégorie")
	author = models.ForeignKey(settings.AUTH_USER_MODEL)
	name = models.CharField(max_length=200,verbose_name="Nom")
	description =   RichTextField(null=True, blank=True)
	tel = models.CharField(max_length=50,null=True, blank=True)
	fb_id = models.CharField(max_length=50,null=True, blank=True)
	insta_id = models.CharField(max_length=50,null=True, blank=True)
	twit_id = models.CharField(max_length=50,null=True, blank=True)
	lind_id = models.CharField(max_length=50,null=True, blank=True)
	address = models.CharField(max_length=200,null=True, blank=True)
	web_site = models.CharField(max_length=100,null=True, blank=True,verbose_name="Site web")
	image = models.ImageField(upload_to="restaurants",null=True, blank=True)
	enabled = models.CharField(max_length=5, choices=ENABLED, default='False')
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def publish(self):
		self.enabled = "True"
		self.save()

	def __str__(self):
		return self.name 