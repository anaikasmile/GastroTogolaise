# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2018-02-22 19:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recipe', '0013_auto_20180208_2013'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recipe',
            name='origin',
            field=models.ManyToManyField(blank=True, related_name='origines', to='recipe.Origin'),
        ),
    ]
