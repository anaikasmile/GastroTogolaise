# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-06-12 08:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recipe', '0004_recipe_timing'),
    ]

    operations = [
        migrations.AddField(
            model_name='recipe',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='recipe',
            name='timing',
            field=models.CharField(blank=True, max_length=5, null=True),
        ),
    ]
