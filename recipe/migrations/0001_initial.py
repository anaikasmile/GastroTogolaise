# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2018-03-25 17:31
from __future__ import unicode_literals

import ckeditor.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django_countries.fields
import embed_video.fields
import taggit.managers


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('taggit', '0002_auto_20150616_2121'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Origin',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ethnic', models.CharField(max_length=200)),
                ('country', django_countries.fields.CountryField(max_length=2)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Recipe',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Nom de la recette')),
                ('description', models.TextField(blank=True, null=True, verbose_name='Description')),
                ('prepare_time', models.DurationField(blank=True, null=True, verbose_name='Temps de préparation')),
                ('cooking_time', models.DurationField(blank=True, null=True, verbose_name='Temps de cuisson')),
                ('total_time', models.DurationField(blank=True, null=True, verbose_name='Prêt dans')),
                ('ingredient', ckeditor.fields.RichTextField(verbose_name='Ingrédients')),
                ('preparation', ckeditor.fields.RichTextField(verbose_name='Instructions')),
                ('image', models.ImageField(blank=True, null=True, upload_to='recipes', verbose_name='Image')),
                ('image_1', models.ImageField(blank=True, null=True, upload_to='recipes', verbose_name='Autre image')),
                ('image_2', models.ImageField(blank=True, null=True, upload_to='recipes', verbose_name='Autre image')),
                ('image_3', models.ImageField(blank=True, null=True, upload_to='recipes', verbose_name='Autre image')),
                ('view', models.IntegerField(blank=True, default=0, null=True, verbose_name='Vue')),
                ('like', models.IntegerField(blank=True, default=0, null=True, verbose_name='Like')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
                ('published_at', models.DateTimeField(blank=True, null=True)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='recipe', to=settings.AUTH_USER_MODEL)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='recipes', to='recipe.Category', verbose_name='Catégorie')),
                ('origin', models.ManyToManyField(blank=True, related_name='origines', to='recipe.Origin', verbose_name='Origine de la recette')),
                ('tags', taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags')),
            ],
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name='Titre')),
                ('description', ckeditor.fields.RichTextField(blank=True, null=True)),
                ('video', embed_video.fields.EmbedVideoField()),
                ('view', models.IntegerField(blank=True, default=0, null=True)),
                ('like', models.IntegerField(blank=True, default=0, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
                ('published_at', models.DateTimeField(blank=True, null=True)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='videos', to=settings.AUTH_USER_MODEL)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='category_video', to='recipe.Category', verbose_name='Catégorie')),
                ('origin', models.ManyToManyField(blank=True, related_name='origin_video', to='recipe.Origin', verbose_name='Origine de la recette')),
                ('tags', taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', through='taggit.TaggedItem', to='taggit.Tag', verbose_name='Tags')),
            ],
        ),
    ]
