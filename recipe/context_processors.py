#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from recipe.models import Category, Video, Recipe
from django.shortcuts import get_object_or_404
from django.db.models import F, Count

def categories(request):
	return {'categories':Category.objects.all()}

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
	top_contributors = Recipe.objects.filter(published_at__isnull=False).filter(author__is_contributor=True).exclude(author__is_staff_member=True).values('author','author__username','author__profile__photo').annotate(total=Count('author__username')).order_by()[:5]

	return {'top_contributors': top_contributors}


def clientIp(request):
	x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
	if x_forwarded_for:
		ip = x_forwarded_for.split(',')[-1].strip()
	elif request.META.get('HTTP_X_REAL_IP'):
		ip = request.META.get('HTTP_X_REAL_IP')
	else:
		ip = request.META.get('REMOTE_ADDR')
	return {'ip':ip}