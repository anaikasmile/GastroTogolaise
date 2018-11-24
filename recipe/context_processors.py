#!/usr/bin/env python
# -*- coding: utf-8 -*-

from recipe.models import Category, Video, Recipe
from django.shortcuts import get_object_or_404
from django.db.models import F, Count

def categories(request):
	return {'categories':Category.objects.all()[:5]}

# def recipe_lasted(request):	
# 	return {'lastrecipes': Recipe.objects.filter(published_at__isnull=False).order_by('published_at').desc()[:4]}

# les recettes les plus vues
def toprecipes(request):
	from django.db.models import F
	return {'toprecipes': Recipe.objects.filter(published_at__isnull=False).filter(view__gt=0).order_by(F('view').desc())[:3]}


# les videos les plus vues
def topvideos(request):
	from django.db.models import F
	return {'topvideos': Video.objects.filter(published_at__isnull=False).filter(view__gt=0).order_by(F('view').desc())[:3]}


# les top 10 contributeurs
def topcontributors(request):
	from django.db.models import F
	top_contributors = Recipe.objects.filter(published_at__isnull=False).values('author','author__username','author__profile__photo').annotate(total=Count('author__username')).order_by()[:5]

	return {'top_contributors': top_contributors}