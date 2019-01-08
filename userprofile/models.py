#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.template.defaultfilters import slugify
from django.contrib.auth.models import User, AbstractUser
from django.db.models.signals import post_save
from django.dispatch import receiver
from sorl.thumbnail import ImageField
from django_countries.fields import CountryField
from django.conf import settings
from django.utils.encoding import python_2_unicode_compatible


class User(AbstractUser):
	is_contributor = models.BooleanField(default=True)
	is_staff_member = models.BooleanField(default=False)

@python_2_unicode_compatible
class Profile(models.Model):
	SEXE = (
        (u'F', _(u'Female')),
        (u'M', _(u'Male')),
    )
	sexe = models.CharField(max_length=10, choices= SEXE)
	user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, primary_key=True)

	#sexe = models.TextField(max_length=2, blank=True)
	bio = models.TextField(max_length=500, blank=True, verbose_name="Biographie")
	country = CountryField(blank_label=_(u'Choisissez le pays'),blank=True, null=True,verbose_name="Pays de résidence")
	# birth_date = models.DateField(null=True, blank=True)
	tel = models.CharField(max_length=50, verbose_name=_(u'Téléphone'), blank=True, help_text=_(u'00228 00 00 00 00'))
	photo = models.ImageField(upload_to="profiles", blank=True, null=True)
	linkedin = models.CharField(max_length=250, verbose_name=_(u'linkedin'), blank=True, help_text=_(u'https://fr.linkedin.com/Togokuizine'))
	facebook = models.CharField(max_length=250, verbose_name=_(u'Facebook'), blank=True, help_text=_(u'https://www.facebook.com/Togokuizine'))
	twitter = models.CharField(max_length=250, verbose_name=_(u'Twitter'), blank=True, help_text=_(u'https://www.twitter.com/Togokuizine'))
	gplus = models.CharField(max_length=250, verbose_name=_(u'Google plus'), blank=True, help_text=_(u'https://plus.google.com/+Togokuizine'))
	instagram = models.CharField(max_length=250, verbose_name=_(u'Instagram'), blank=True, help_text=_(u'https://www.instagram.com/Togokuizine'))

	created_at = models.DateTimeField(blank=True, auto_now_add=True, null=True)
	update_at = models.DateTimeField(auto_now=True, blank=True, null=True)
	slug = models.SlugField(null=False,unique=False, blank=True)

	job = models.CharField(max_length=50, verbose_name=_(u'Profession'), blank=True, null= True, help_text=_(u''))

	def __str__(self):
		return self.user.username

	@receiver(post_save, sender=User)
	def create_user_profile(sender, instance, created, **kwargs):
		if created:
			Profile.objects.create(user=instance)

	@receiver(post_save, sender=User)
	def save_user_profile(sender, instance, **kwargs):
		instance.profile.save()
