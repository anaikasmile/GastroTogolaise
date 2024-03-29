#!/usr/bin/env python
# -*- coding: utf-8 -*-
from blog.models import Post, Category
from django.shortcuts import get_object_or_404
from django.db.models import F

# Liste les 4 dernieres publications
def post_lasted(request):	
	return {'lastposts': Post.objects.filter(published_at__isnull=False).order_by('-published_at')[:3]}


def post_category(request):
	return {'post_categories':Category.objects.all()[:5]}