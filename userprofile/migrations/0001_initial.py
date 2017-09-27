# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-06-26 15:13
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bio', models.TextField(blank=True, max_length=500)),
                ('location', models.CharField(blank=True, max_length=30)),
                ('tel', models.CharField(blank=True, help_text='00228 00 00 00 00', max_length=50, verbose_name='Phone number')),
                ('photo', models.ImageField(blank=True, null=True, upload_to='profiles')),
                ('linkedin', models.CharField(blank=True, help_text='linkedin ID', max_length=50, verbose_name='lindkedin')),
                ('facebook', models.CharField(blank=True, help_text='facebook ID', max_length=50, verbose_name='Facebook')),
                ('twitter', models.CharField(blank=True, help_text='Twitter ID', max_length=50, verbose_name='Twitter')),
                ('gplus', models.CharField(blank=True, help_text='Twitter ID', max_length=50, verbose_name='Google plus')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('update_at', models.DateTimeField(auto_now=True, null=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
