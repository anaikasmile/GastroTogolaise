from django.db import models
from django.utils.translation import ugettext_lazy as _
from ckeditor.fields import RichTextField
from sorl.thumbnail import ImageField
# Create your models here.
from django.utils import timezone


class Restaurant(models.Model):
	CATEGORY = (
        (u'Restaurant', _(u'Restaurant')),
        (u'Traiteur', _(u'Service traiteur')),
    )
	name = models.CharField(max_length=200)
	category = models.CharField(max_length=20, choices= CATEGORY)
	description =   RichTextField(null=True, blank=True)
	tel = models.CharField(max_length=50,null=True, blank=True)
	address = models.CharField(max_length=200,null=True, blank=True)
	web_site = models.CharField(max_length=100,null=True, blank=True)
	image = models.ImageField(upload_to="restaurants",null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now=True)

	def __str__(self):
		return self.name 