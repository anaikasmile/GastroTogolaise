#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404, JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.utils import timezone
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils.text import slugify

from .models import Post, Category
from .forms import PostForm, CategoryForm

# Create your views here.
from gastronomie.decorators import *



def pagination(request,fichier):
    paginator = Paginator(fichier,3)

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


def post_list(request):
	posts = Post.objects.filter(published_at__lte=timezone.now()).order_by('-published_at')
	posts = pagination(request, posts)
	return render(request,'blog/post_list.html',{'posts':posts})

#Liste des articles par categorie
def post_per_cat(request,pk):
	category_post = get_object_or_404(Category, pk=pk)
	posts = category_post.posts.all().filter(published_at__isnull=False).order_by('-published_at')
	posts = pagination(request, posts)
	return render(request,'blog/post_list.html', {'posts':posts, 'category_post':category_post})

#Liste des articles  par tag
def post_per_tag(request):
	#category = get_object_or_404(Category, pk=pk)
	if request.method == 'GET':
		tag = request.GET.get('tag')
		posts =  Post.objects.filter(tags__name=tag).filter(published_at__isnull=False).order_by('-published_at')
		posts = pagination(request, posts)
	return render(request,'blog/post_list.html', {'posts':posts})


def post_detail(request,slug):
	post = get_object_or_404(Post, slug=slug)
	post.view = post.view + 1 #Incrementer le nombre de vue a chaque clique sur les details de la recette
	post.save()

	#post_related = Post.objects.filter(title__contains=search_word).filter(published_at__isnull=False).order_by('-published_at').exclude(pk=post.pk)[:3]
	post_author = Post.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=post.author).exclude(pk=post.pk)
	return render(request, 'blog/post_detail.html',{'post':post,'post_author':post_author})



# Liker
def like(request):
	if request.method =='GET':
		post_pk  = request.GET['post_pk']
		p = Post.objects.get(pk=post_pk)
		like = p.like + 1
		p.like = like
		p.save()
	return HttpResponse(like)


''' Administration '''



# @login_required
@login_required
@staff_required
def post_new(request):
	if request.method == "POST":

		form = PostForm(request.POST, request.FILES)
		if form.is_valid():
			post = form.save(commit=False)
			post.author = request.user
			post.slug = slugify(post.title)
			post.save()
			form.save_m2m()
			return redirect ('post_preview',slug=post.slug)
	else:
		form = PostForm()
	return render(request, 'blog/post_new.html',{'form':form})

# Apercu
@login_required
@staff_required
def post_preview(request,slug):
	post = get_object_or_404(Post, slug=slug)
	return render(request, 'blog/post_preview.html',{'post':post})


#@login_required
@login_required
@staff_required
def post_update(request,slug):
	post = get_object_or_404(Post, slug=slug)
	if request.method == "POST":
		form = PostForm(request.POST,request.FILES, instance=post)
		if form.is_valid():
			post = form.save(commit=False)
			post.save()
			form.save_m2m()
			messages.success(request, 'Post updated',extra_tags='alert')
		return redirect('post_preview', slug=post.slug)
	else:
		form = PostForm(instance=post)
	return render(request, 'blog/post_new.html', {'form': form})

#@login_required
@login_required
@staff_required
def post_draft_list(request):
	posts = Post.objects.filter(published_at__isnull=True).order_by('published_at')
	posts = admin_pagination(request, posts)
	return render(request,'blog/post_draft_list.html',{'posts':posts})

#@login_required
@login_required
@staff_required
def post_publish_list(request):
	posts = Post.objects.filter(published_at__isnull=False).order_by('published_at')
	posts = admin_pagination(request, posts)
	return render(request,'blog/post_publish_list.html',{'posts':posts})


#@login_required
@login_required
@staff_required
def post_publish(request, slug):
    post = get_object_or_404(Post, slug=slug)
    post.publish()
    messages.success(request, 'Your post was published!',extra_tags='alert')
    return redirect('post_draft_list')



# @login_required
@login_required
@staff_required
def post_delete(request,slug):
	post = get_object_or_404(Post, slug=slug)
	post.delete()
	messages.success(request, 'Post deleted',extra_tags='alert')
	return redirect('post_publish_list')



# Ajout de la catégorie de post
@login_required
@staff_required
def post_new_category(request):
	if request.method == "POST":
		form = CategoryForm(request.POST)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect('/blog/new/')
		else:
			pass
	else:
		form = CategoryForm()

	categBlog = Category.objects.all()
	contextBlog = {
		'form': form,
		'categBlog': categBlog
	}
	return render(request, 'blog/post_new_category.html',contextBlog)

#Modifier la categorie
@login_required
@staff_required
def post_category_update(request,slug):
	category = get_object_or_404(Category, slug=slug)
	if request.method == "POST":
		form = CategoryForm(request.POST,request.FILES, instance=category)
		if form.is_valid():
			form.save()
			messages.success(request, 'Catégorie modifiée')
		return redirect('post_new_categ')
	else:
		form = CategoryForm(instance=category)
	categBlog = Category.objects.all()
	contextBlog = {
		'form': form,
		'categBlog': categBlog
	}
	return render(request, 'blog/post_new_category.html', contextBlog)


#Supprimer une categorie
@login_required
@staff_required
def post_category_delete(request,slug):
	category = get_object_or_404(Category, slug=slug)
	category.delete()
	messages.success(request, 'Catégorie supprimée')
	return redirect('post_publish_list')

#fin ajout



# def add_comment_post(request,slug):
# 	post = get_object_or_404(Post, slug=slug)
# 	if request.method == "POST":
# 		form = CommentForm(request.POST)
# 		if form.is_valid():
# 			comment = form.save(commit=False)
# 			comment.post = post
# 			comment.save()
# 		return redirect('post_detail', slug=post.slug)
# 	else:
# 		form = CommentForm()
# 	return render(request, 'blog/add_comment_to_post.html', {'form': form})


# @login_required
# def comment_approve(request, slug):
#     comment = get_object_or_404(Comment, slug=slug)
#     comment.approve()
#     return redirect('post_detail', slug=comment.post.slug)

# @login_required
# def comment_remove(request, slug):
#     comment = get_object_or_404(Comment, slug=slug)
#     comment.delete()
#     return redirect('post_detail', slug=comment.post.slug)