#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth.models import User, Group
from recipe.models import Recipe, Category, Video


import django_filters


class CategoryFilter(django_filters.FilterSet):
    class Meta:
         model = Category
         fields = ['name','slug']


class RecipeFilter(django_filters.FilterSet):
    class Meta:
        model = Recipe
        fields = ['title','description']