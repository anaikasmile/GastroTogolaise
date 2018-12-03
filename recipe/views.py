#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404, JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.contrib import messages
from django.utils.text import slugify
from django.urls import reverse
from django_comments.models import Comment
from recipe.models import Recipe, Category, Video, Origin

from recipe.forms import RecipeForm, VideoForm, CategoryForm, OriginFormset, OriginForm
from userprofile.models import Profile, User
from blog.models import Post
from django.contrib.admin.views.decorators import staff_member_required
from gastronomie.decorators import *
from django.conf import settings
from django.db.models import Count, F
from notify.signals import notify
from django.views import generic
from django.views import generic

from django_addanother.views import CreatePopupMixin, UpdatePopupMixin


import itertools


# Create your views here.

def pagination(request,fichier):
    paginator = Paginator(fichier,6)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p


def admin_pagination(request,fichier):
    paginator = Paginator(fichier,15)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p


#Liste des categories
def home(request):
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at')	
	recipes = pagination(request, recipes)
	
	return render(request,'recipe/accueil.html',{'recipes':recipes})

#Ajouter une ethnie
# @login_required
# def origin_add(request):
# 	if request.method == "POST":
# 		form = OriginForm(request.POST)

# 		if form.is_valid():

# 			form.save()
			

# 	else:
# 		form = OriginForm()

# 	return render(request,'recipe/origin_add.html', {'form':form})


class OriginAdd(CreatePopupMixin, generic.CreateView):
    model = Origin
    fields = ['ethnic','country']
    def get_success_url(self):
        return reverse('recipe_add')


#Ajouter une recette
@login_required
def recipe_add(request):
	if request.method == "POST":
		form = RecipeForm(request.POST, request.FILES)
		#user = User.objects.get(username='root')
		users = User.objects.filter(is_staff_member=True)

		users_list = list(users)


		if form.is_valid():
			recipe = form.save(commit=False)
			recipe.author = request.user
			#recipe.slug = slugify(recipe.title)
			max_length = Recipe._meta.get_field('slug').max_length
			recipe.slug = orig = slugify(recipe.title)[:max_length]
			#instance.author = request.user
			for x in itertools.count(1):
				if not Recipe.objects.filter(slug=recipe.slug).exists():
					break

			# Truncate the original slug dynamically. Minus 1 for the hyphen.
				recipe.slug = "%s-%d" % (orig[:max_length - len(str(x)) - 1], x)

			recipe.save()
			
			form.save_m2m()

			recipe.readytime()

			url = reverse('recipe_preview', args=(recipe.slug,))

			
			messages.success(request, ('Votre recette a été envoyée'))

			if request.user.is_staff_member:
				print('ok')
			else:
				notify.send(request.user, recipient_list=users_list, actor=request.user, target=recipe, target_url=url, verb='a publié une nouvelle recette', nf_type='waiting_recipe')

			return redirect("recipe_add")
	
	else:
		form = RecipeForm()
	return render(request,'recipe/recipe_add.html', {'form':form})




#Liste de toutes les recettes
def recipe_list(request):
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at')
	recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes})


#Liste des recettes par categorie
def recipe_per_cat(request,slug):
	category = get_object_or_404(Category, slug=slug)
	recipes = category.recipes.all().filter(published_at__isnull=False).order_by('-published_at')
	recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes, 'category':category})


#Liste des recettes par ethnie
def recipe_per_origin(request):
	if request.method == 'GET':
		origin = request.GET.get('origin')
		recipes =  Recipe.objects.filter(origin__ethnic=origin).filter(published_at__isnull=False).order_by('-published_at')
		recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes})

#Liste des recettes par tag
def recipe_per_tag(request):
	#category = get_object_or_404(Category, pk=pk)
	if request.method == 'GET':
		tag = request.GET.get('tag')
		recipes =  Recipe.objects.filter(tags__name=tag).filter(published_at__isnull=False).order_by('-published_at')
		recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes})



#Liste des recettes par contributeur
def recipe_per_contributor(request,pk):
	contributor = get_object_or_404(User, pk=pk)
	recipes = contributor.recipe.all().filter(published_at__isnull=False).order_by('-published_at')
	recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes})


#Affiche les details d'une recette
def recipe_detail(request,slug):
	recipe = get_object_or_404(Recipe,slug=slug)
	recipe.view = recipe.view+1 #Incrementer le nombre de vue a chaque visaualisation d'une recette
	recipe.save()
	search_word = recipe.title
	

	recipe_author = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=recipe.author).exclude(slug=recipe.slug)[:3]
	recipe_related = Recipe.objects.filter(title__contains=search_word).filter(published_at__isnull=False).order_by('-published_at').exclude(slug=recipe.slug)[:3]
	
	# page = request.GET.get('page', 1)
	# paginator = Paginator(recipe_author, 3)
	# try:
	# 	recipe_author = paginator.page(page)
	# except PageNotAnInteger:
	# 	recipe_author = paginator.page(1)
	# except EmptyPage:
	# 	recipe_author = paginator.page(paginator.num_pages)

	return render(request,'recipe/recipe_detail.html',{'recipe':recipe,'recipe_author':recipe_author,'recipe_related':recipe_related})

# Liker une recette
def like(request):
	if request.method =='GET':
		recipe_pk  = request.GET['recipe_pk']
		r = Recipe.objects.get(pk=recipe_pk)
		like = r.like + 1
		r.like = like
		r.save()
	return HttpResponse(like)


###   Videos  ###

def video_list(request):
 	videos = Video.objects.all().order_by('-published_at')
 	videos = pagination(request, videos)
 	return render(request,'recipe/video_list.html',{'videos':videos})

#Liste des recettes video par tag
def video_per_tag(request):
	#category = get_object_or_404(Category, pk=pk)
	if request.method == 'GET':
		tag = request.GET.get('tag')
		videos =  Video.objects.filter(tags__name=tag).filter(published_at__isnull=False).order_by('-published_at')
		videos = pagination(request, videos)
	return render(request,'recipe/video_list.html', {'videos':videos})


def video_detail(request,slug):
	video = get_object_or_404(Video,slug=slug)
	video.view = video.view+1 #Incrementer le nombre de vue a chaque visaualisation d'une recette
	video.save()
	

	video_author = Video.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=video.author).exclude(slug=video.slug)
	page = request.GET.get('page', 1)
	paginator = Paginator(video_author, 3)
	try:
		video_author = paginator.page(page)
	except PageNotAnInteger:
		video_author = paginator.page(1)
	except EmptyPage:
		video_author = paginator.page(paginator.num_pages)

	return render(request,'recipe/video_detail.html',{'video':video,'video_author':video_author})

# Liker une video
def likevideo(request):
	if request.method =='GET':
		video_pk  = request.GET['video_pk']
		r = Video.objects.get(pk=video_pk)
		like = r.like + 1
		r.like = like
		r.save()
	return HttpResponse(like)


#Box de l'utilisateur en ligne
@login_required
def recipe_box_user(request):
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=request.user)
	nb = recipes.count()
	recipes = admin_pagination(request, recipes)
	return render(request,'recipe/recipe_box_user.html',{'recipes':recipes, 'nb':nb})


""" Partie Administration """




#Page accueil administration(Tableau de board)

@login_required
@staff_required
def stats(request):
	nb_recipes = Recipe.objects.filter(published_at__isnull=False).count()
	nb_posts = Post.objects.filter(published_at__isnull=False).count()
	nb_users = Profile.objects.count()
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at')[:10]
	


	contextStats = {
		'nb_recipes':nb_recipes,
		'nb_posts':nb_posts,
		'nb_users':nb_users,
		'recipes': recipes
	}

	return render(request,'stats.html',contextStats)


#Liste des recettes en attente de publication
@login_required
@staff_required
def recipe_draft_list(request):
	recipes = Recipe.objects.filter(published_at__isnull=True).order_by('-created_at')
	recipes = admin_pagination(request, recipes)
	return render(request, 'recipe/recipe_draft_list.html', {'recipes':recipes})

#Liste des recettes en attente de publication
@login_required
@staff_required
def recipe_publish_list(request):
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at')
	recipes = admin_pagination(request, recipes)
	return render(request, 'recipe/recipe_publish_list.html', {'recipes':recipes})


#Affiche les details d'une recette
@login_required
@staff_required
def recipe_preview(request,slug):
	recipe = get_object_or_404(Recipe,slug=slug)
	return render(request,'recipe/recipe_preview.html',{'recipe':recipe})

#Approuver une recette
@login_required
@staff_required
def recipe_publish(request,slug):
	recipe = get_object_or_404(Recipe,slug=slug)
	recipe.publish()
	url = reverse('recipe_detail', args=(recipe.slug,))
	messages.success(request, 'approuvée')

	notify.send(request.user, recipient=recipe.author, target=recipe, target_url=url, actor=request.user, verb='a été publiée', nf_type='approve_recipe')

	return redirect('recipe_draft_list')

#ajout du 06/06/18

#Ajouter une cattegorie de recette
@login_required
@staff_required
def recipe_new_category(request):
	if request.method == "POST":
		form = CategoryForm(request.POST)
		if form.is_valid():
			form.save()
			messages.success(request, 'Votre catégorie de recette a été enregistrée')
			return HttpResponseRedirect("/recipe/new/category")
		else:
			pass
	else:
		form = CategoryForm()

	categRecipe = Category.objects.all()
	contextRecipe = {
		'form':form,
		'categRecipe':categRecipe
	}
	return render(request,'recipe/recipe_new_category.html', contextRecipe)

#Modifier la categorie
@login_required
@staff_required
def recipe_category_update(request,slug):
	category = get_object_or_404(Category, slug=slug)
	if request.method == "POST":
		form = CategoryForm(request.POST,request.FILES, instance=category)
		if form.is_valid():
			form.save()
			messages.success(request, 'Category updated')
		return redirect('recipe_new_categ')
	else:
		form = CategoryForm(instance=category)
	return render(request, 'recipe/recipe_category_update.html', {'form': form})


#Supprimer une categorie
@login_required
@staff_required
def recipe_category_delete(request,slug):
	category = get_object_or_404(Category, slug=slug)
	category.delete()
	messages.success(request, 'Your category deleted')
	return redirect('recipe_publish_list')

#fin ajout

#Ajouter une recette
@login_required
@staff_required
def recipe_new(request):
	if request.method == "POST":
		form = RecipeForm(request.POST, request.FILES)
		if form.is_valid():
			recipe = form.save(commit=False)
			recipe.author = request.user
			#recipe.published_at = timezone.now()
			recipe.slug = slugify(recipe.title)
			recipe.save()
			recipe.readytime()
			messages.success(request, 'Votre recette a été enregistrée')
			return redirect ('recipe_preview',slug=recipe.slug)

	else:
		form = RecipeForm()
	return render(request,'recipe/recipe_new.html', {'form':form})


#Modifier une recette
@login_required
@staff_required
def recipe_update(request,slug):
	recipe = get_object_or_404(Recipe, slug=slug)
	if request.method == "POST":
		form = RecipeForm(request.POST,request.FILES, instance=recipe)
		if form.is_valid():
			recipe = form.save(commit=False)
			recipe.save()
			form.save_m2m()
			recipe.readytime()
			messages.success(request, 'Recipe updated')
		return redirect('recipe_preview', slug=recipe.slug)
	else:
		form = RecipeForm(instance=recipe)
	return render(request, 'recipe/recipe_update.html', {'form': form})



#Supprimer une recette
@login_required
@staff_required
def recipe_delete(request,slug):
	recipe = get_object_or_404(Recipe, slug=slug)
	recipe.delete()
	messages.success(request, 'Your recipe deleted')	
	return redirect('recipe_publish_list')


@login_required
@staff_required
def video_new(request):
	if request.method == "POST":

		form = VideoForm(request.POST)
		if form.is_valid():
			video = form.save(commit=False)
			video.author = request.user
			video.slug = slugify(video.title)
			video.save()
			form.save_m2m()
			return redirect ('video_preview',slug=video.slug)
	else:
		form = VideoForm()
	return render(request, 'recipe/video_new.html',{'form':form})

@login_required
@staff_required
def video_edit(request,slug):
	video = get_object_or_404(Video, slug=slug)
	if request.method == "POST":
		form = VideoForm(request.POST, instance=video)
		if form.is_valid():
			video = form.save(commit=False)
			video.save()
			form.save_m2m()
			messages.success(request, 'Video updated')
		return redirect('video_preview', slug=video.slug)
	else:
		form = VideoForm(instance=video)
	return render(request, 'recipe/video_new.html', {'form': form})


# Apercu
@login_required
@staff_required
def video_preview(request,slug):
	video = get_object_or_404(Video, slug=slug)
	return render(request, 'recipe/video_preview.html',{'video':video})


@login_required
@staff_required
def video_draft_list(request):
	videos = Video.objects.filter(published_at__isnull=True).order_by('published_at')
	return render(request,'recipe/video_draft_list.html',{'videos':videos})

@login_required
@staff_required
def video_publish_list(request):
	videos = Video.objects.filter(published_at__isnull=False).order_by('published_at')
	return render(request,'recipe/video_publish_list.html',{'videos':videos})



@login_required
@staff_required
def video_publish(request, slug):
    video = get_object_or_404(Video, slug=slug)
    video.publish()
    messages.success(request, 'Your video was published!')
    return redirect('video_draft_list')

@login_required
@staff_required
def video_delete(request,slug):
	video = get_object_or_404(Video, slug=slug)
	video.delete()
	messages.success(request, 'Video deleted')
	return redirect('video_publish_list')



#Ajouter une cattegorie de recette
@login_required
@staff_required
def recipe_new_category(request):
	if request.method == "POST":
		form = CategoryForm(request.POST)
		if form.is_valid():
			form.save()
			messages.success(request, 'Catégorie ajoutée')
			return HttpResponseRedirect("/recipe/new/category")
		else:
			pass
	else:
		form = CategoryForm()

	categRecipe = Category.objects.all()
	contextRecipe = {
		'form':form,
		'categRecipe':categRecipe
	}
	return render(request,'recipe/recipe_new_category.html', contextRecipe)


#Modifier la categorie
@login_required
@staff_required
def recipe_category_update(request,slug):
	category = get_object_or_404(Category, slug=slug)
	if request.method == "POST":
		form = CategoryForm(request.POST,request.FILES, instance=category)
		if form.is_valid():
			form.save()
			messages.success(request, 'Catégorie mis à jour')
		return redirect('recipe_new_categ')
	else:
		form = CategoryForm(instance=category)

	categRecipe = Category.objects.all()
	contextRecipe = {
		'form':form,
		'categRecipe':categRecipe
	}
	return render(request, 'recipe/recipe_new_category.html', contextRecipe)



#Supprimer une categorie
@login_required
@staff_required
def recipe_category_delete(request,slug):
	category = get_object_or_404(Category, slug=slug)
	category.delete()
	messages.success(request, 'Catégorie supprimée')
	return redirect('recipe_publish_list')

#fin ajout
