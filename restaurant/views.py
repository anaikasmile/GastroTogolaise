#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404, JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django_comments.models import Comment
from django.contrib.admin.views.decorators import staff_member_required
from django.utils.text import slugify

from .models import Restaurant, Category
from .forms import RestaurantForm, CategoryForm
from gastronomie.decorators import *
# Create your views here.

def pagination(request,fichier):
    paginator = Paginator(fichier,4)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p

#Liste de tous les restaurants
def restaurant_list(request):
	#restaurants = category.restaurants.all().filter(published_at__isnull=False).order_by('-published_at')
	restaurants = Restaurant.objects.filter(category='Restaurant')
	restaurants = pagination(request, restaurants)

	return render(request,'restaurant/restaurant_list.html', {'restaurants':restaurants})

def traiteur_list(request):
	restaurants = Restaurant.objects.filter(category='Traiteur')
	restaurants = pagination(request, restaurants)
	return render(request,'restaurant/restaurant_list.html', {'restaurants':restaurants})

#Liste des addresses par categorie
def restaurant_per_cat(request,slug):
	category = get_object_or_404(Category, slug=slug)
	restaurants = category.addresses.all().filter(enabled='True')
	restaurants = pagination(request, restaurants)
	return render(request,'restaurant/restaurant_list.html', {'restaurants':restaurants, 'category_address':category})



""" Administration """

#Ajouter
@login_required
@staff_required
def restaurant_new(request):
	if request.method == "POST":
		form = RestaurantForm(request.POST, request.FILES)
		if form.is_valid():
			restaurant = form.save(commit=False)
			restaurant.author = request.user
			restaurant.slug = slugify(restaurant.name)
			restaurant.save()
			messages.success(request, ('Enregistrement réussi'))
			return redirect ('restaurant_preview',slug=restaurant.slug)

	else:
		form = RestaurantForm()
	return render(request,'restaurant/restaurant_new.html', {'form':form})


#Modifier
@login_required
@staff_required
def restaurant_update(request,slug):
	restaurant = get_object_or_404(Restaurant, slug=slug)
	if request.method == "POST":
		form = RestaurantForm(request.POST,request.FILES, instance=restaurant)
		if form.is_valid():
			form.save()
			messages.success(request, ('Enregistrement réussi'))
		return redirect('restaurant_preview', slug=restaurant.slug)
	else:
		form = RestaurantForm(instance=restaurant)
	return render(request, 'restaurant/restaurant_update.html', {'form': form})


#Supprimer
@login_required
@staff_required
def restaurant_delete(request,slug):
	restaurant = get_object_or_404(Restaurant, slug=slug)
	restaurant.delete()
	messages.success(request, 'Suppression réussie')
	return redirect('restaurant_publish_list')


#Liste de tous les bons plans
@login_required
@staff_required
def restaurant_publish_list(request):
	restaurants = Restaurant.objects.all()
	restaurants = pagination(request, restaurants)
	return render(request,'restaurant/restaurant_publish_list.html', {'restaurants':restaurants})


@login_required
@staff_required
def restaurant_preview(request,slug):
	restaurant = get_object_or_404(Restaurant,slug=slug)
	return render(request,'restaurant/restaurant_preview.html',{'restaurant':restaurant})

#Approuver une recette
@login_required
@staff_required
def restaurant_publish(request,slug):
	restaurant = get_object_or_404(Restaurant,slug=slug)
	restaurant.publish()
	messages.success(request, 'Action réussie')
	return redirect('restaurant_publish_list')




# Ajout de la catégorie de post
@login_required
@staff_required
def restaurant_new_category(request):
	if request.method == "POST":
		form = CategoryForm(request.POST)
		if form.is_valid():
			category = form.save(commit=False)
			category.slug = slugify(category.name)
			category.save()
			return HttpResponseRedirect('/restaurant/new/category')
		else:
			pass
	else:
		form = CategoryForm()

	categBlog = Category.objects.all()
	contextBlog = {
		'form': form,
		'categBlog': categBlog
	}
	return render(request, 'restaurant/restaurant_new_category.html',contextBlog)

#Modifier la categorie
@login_required
@staff_required
def restaurant_category_update(request,slug):
	category = get_object_or_404(Category, slug=slug)
	if request.method == "POST":
		form = CategoryForm(request.POST,request.FILES, instance=category)
		if form.is_valid():
			form.save()
			messages.success(request, 'Catégorie modifiée')
		return redirect('restaurant_new_categ')
	else:
		form = CategoryForm(instance=category)
	categBlog = Category.objects.all()
	contextBlog = {
		'form': form,
		'categBlog': categBlog
	}
	return render(request, 'restaurant/restaurant_new_category.html', contextBlog)


#Supprimer une categorie
@login_required
@staff_required
def restaurant_category_delete(request,slug):
	category = get_object_or_404(Category, slug=slug)
	category.delete()
	messages.success(request, 'Catégorie supprimée')
	return redirect('restaurant_new_categ')
