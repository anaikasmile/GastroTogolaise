from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.template.defaultfilters import slugify
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from sorl.thumbnail import ImageField

class Profile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	bio = models.TextField(max_length=500, blank=True)
	location = models.CharField(max_length=30, blank=True)
	# birth_date = models.DateField(null=True, blank=True)
	tel = models.CharField(max_length=50, verbose_name=_(u'Phone number'), blank=True, help_text=_(u'00228 00 00 00 00'))
	photo = models.ImageField(upload_to="profiles", blank=True, null=True)
	linkedin = models.CharField(max_length=50, verbose_name=_(u'lindkedin'), blank=True, help_text=_(u'linkedin ID'))
	facebook = models.CharField(max_length=50, verbose_name=_(u'Facebook'), blank=True, help_text=_(u'facebook ID'))
	twitter = models.CharField(max_length=50, verbose_name=_(u'Twitter'), blank=True, help_text=_(u'Twitter ID'))
	gplus = models.CharField(max_length=50, verbose_name=_(u'Google plus'), blank=True, help_text=_(u'Google plus ID'))

	created_at = models.DateTimeField(blank=True, auto_now_add=True, null=True)
	update_at = models.DateTimeField(auto_now=True, blank=True, null=True)

	def __str__(self):
		return self.user.username

	@receiver(post_save, sender=User)
	def create_user_profile(sender, instance, created, **kwargs):
		if created:
			Profile.objects.create(user=instance)

	@receiver(post_save, sender=User)
	def save_user_profile(sender, instance, **kwargs):
		instance.profile.save()