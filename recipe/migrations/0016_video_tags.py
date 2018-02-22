# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2018-02-22 20:54
from __future__ import unicode_literals

from django.db import migrations
import taggit.managers


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0002_auto_20150616_2121'),
        ('recipe', '0015_recipe_tags'),
    ]

    operations = [
        migrations.AddField(
            model_name='video',
            name='tags',
            field=taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags'),
        ),
    ]
