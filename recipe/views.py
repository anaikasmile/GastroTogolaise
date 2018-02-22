from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404, JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.contrib import messages
from django_comments.models import Comment
from recipe.models import Recipe, Category, Video
from recipe.forms import RecipeForm, VideoForm

from gastronomie.decorators import *
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
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at')[:6]	
	return render(request,'recipe/accueil.html',{'recipes':recipes})




#Ajouter une recette
@login_required
def recipe_add(request):
	if request.method == "POST":

		form = RecipeForm(request.POST, request.FILES)
		if form.is_valid():
			recipe = form.save(commit=False)
			recipe.author = request.user
			recipe.save()
			recipe.readytime()
			messages.success(request, 'Your recipe was send',extra_tags='alert')
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
def recipe_per_cat(request,pk):
	category = get_object_or_404(Category, pk=pk)
	recipes = category.recipes.all().filter(published_at__isnull=False).order_by('-published_at')
	recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes, 'category':category})

#Liste des recettes par contributeur
def recipe_per_contributor(request,pk):
	contributor = get_object_or_404(User, pk=pk)
	recipes = contributor.recipe.all().filter(published_at__isnull=False).order_by('-published_at')
	recipes = pagination(request, recipes)
	return render(request,'recipe/recipe_list.html', {'recipes':recipes})


#Affiche les details d'une recette
def recipe_detail(request,pk):
	recipe = get_object_or_404(Recipe,pk=pk)
	recipe.view = recipe.view+1 #Incrementer le nombre de vue a chaque visaualisation d'une recette
	recipe.save()
	

	recipe_author = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=recipe.author).exclude(pk=recipe.pk)
	page = request.GET.get('page', 1)
	paginator = Paginator(recipe_author, 3)
	try:
		recipe_author = paginator.page(page)
	except PageNotAnInteger:
		recipe_author = paginator.page(1)
	except EmptyPage:
		recipe_author = paginator.page(paginator.num_pages)

	return render(request,'recipe/recipe_detail.html',{'recipe':recipe,'recipe_author':recipe_author})

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
	return render(request,'video/video_list.html',{'videos':videos})



#Liste des videos par categorie
def videos_per_cat(request,pk):
	category = get_object_or_404(Category, pk=pk)
	videos = category.recipes.all().filter(published_at__isnull=False).order_by('-published_at')
	videos = pagination(request, videos)
	return render(request,'video/video_list.html', {'videos':videos, 'category_video':category})

# Video detail
def video_detail(request,pk):
	video = get_object_or_404(Video,pk=pk)
	video.view = video.view+1 #Incrementer le nombre de vue a chaque visaualisation d'une recette
	video.save()
	

	video_author = Video.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=video.author).exclude(pk=video.pk)
	page = request.GET.get('page', 1)
	paginator = Paginator(video_author, 3)
	try:
		video_author = paginator.page(page)
	except PageNotAnInteger:
		video_author = paginator.page(1)
	except EmptyPage:
		video_author = paginator.page(paginator.num_pages)

	return render(request,'video/video_view.html',{'video':video,'video_author':video_author})

def video_view(request):

	return render(request,'recipe/video_view.html',{})




#Box de l'utilisateur en ligne
@login_required
def recipe_box_user(request):
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=request.user)
	recipes = admin_pagination(request, recipes)
	return render(request,'recipe/recipe_box_user.html',{'recipes':recipes})


""" Partie Administration """


#Page accueil administration
def stats(request):
	return render(request,'stats.html',{})


#Liste des recettes en attente de publication
@login_required
@group_required('staff')
def recipe_draft_list(request):
	recipes = Recipe.objects.filter(published_at__isnull=True).order_by('created_at')
	recipes = admin_pagination(request, recipes)
	return render(request, 'recipe/recipe_draft_list.html', {'recipes':recipes})

#Liste des recettes en attente de publication
@login_required
@group_required('staff')
def recipe_publish_list(request):
	recipes = Recipe.objects.filter(published_at__isnull=False).order_by('-published_at')
	recipes = admin_pagination(request, recipes)
	return render(request, 'recipe/recipe_publish_list.html', {'recipes':recipes})


#Affiche les details d'une recette
@login_required
@group_required('staff')
def recipe_preview(request,pk):
	recipe = get_object_or_404(Recipe,pk=pk)
	return render(request,'recipe/recipe_preview.html',{'recipe':recipe})

#Approuver une recette
@login_required
@group_required('staff')
def recipe_publish(request,pk):
	recipe = get_object_or_404(Recipe,pk=pk)
	recipe.publish()
	messages.success(request, 'Votre recette a ete publiee',extra_tags='alert')
	return redirect('recipe_draft_list')

#Ajouter une recette
@login_required
@group_required('staff')
def recipe_new(request):
	if request.method == "POST":
		form = RecipeForm(request.POST, request.FILES)
		if form.is_valid():
			recipe = form.save(commit=False)
			recipe.author = request.user
			#recipe.published_at = timezone.now()
			recipe.save()
			recipe.readytime()
			messages.success(request, 'Your recipe was send',extra_tags='alert')
			return redirect("recipe_new")
			return redirect ('recipe_preview',pk=recipe.pk)

	else:
		form = RecipeForm()
	return render(request,'recipe/recipe_new.html', {'form':form})


#Modifier une recette
@login_required
@group_required('staff')
def recipe_update(request,pk):
	recipe = get_object_or_404(Recipe, pk=pk)
	if request.method == "POST":
		form = RecipeForm(request.POST,request.FILES, instance=recipe)
		if form.is_valid():
			recipe = form.save(commit=False)
			recipe.save()
			recipe.readytime()
			messages.success(request, 'Recipe updated',extra_tags='alert')
		return redirect('recipe_preview', pk=recipe.pk)
	else:
		form = RecipeForm(instance=recipe)
	return render(request, 'recipe/recipe_update.html', {'form': form})


#Supprimer une recette
def recipe_delete(request,pk):
	recipe = get_object_or_404(Recipe, pk=pk)
	recipe.delete()
	messages.success(request, 'Your recipe deleted',extra_tags='alert')	
	return redirect('recipe_publish_list')



def video_new(request):
	if request.method == "POST":

		form = VideoForm(request.POST)
		if form.is_valid():
			video = form.save(commit=False)
			video.author = request.user
			video.save()
			return redirect ('video_preview',pk=video.pk)
	else:
		form = VideoForm()
	return render(request, 'video/video_new.html',{'form':form})

#@login_required
def video_edit(request,pk):
	video = get_object_or_404(Video, pk=pk)
	if request.method == "POST":
		form = VideoForm(request.POST, instance=video)
		if form.is_valid():
			video = form.save(commit=False)
			video.save()
			messages.success(request, 'Video updated',extra_tags='alert')
		return redirect('video_preview', pk=video.pk)
	else:
		form = VideoForm(instance=video)
	return render(request, 'video/video_new.html', {'form': form})


# Apercu
def video_preview(request,pk):
	video = get_object_or_404(Video, pk=pk)
	return render(request, 'video/video_preview.html',{'video':video})


#@login_required
def video_draft_list(request):
	videos = Video.objects.filter(published_at__isnull=True).order_by('published_at')
	return render(request,'video/video_draft_list.html',{'videos':videos})

#@login_required
def video_publish_list(request):
	videos = Video.objects.filter(published_at__isnull=False).order_by('published_at')
	return render(request,'video/video_publish_list.html',{'videos':videos})


#@login_required
def video_publish(request, pk):
    video = get_object_or_404(Video, pk=pk)
    video.publish()
    messages.success(request, 'Your video was published!',extra_tags='alert')
    return redirect('video_draft_list')

# @login_required
def video_delete(request,pk):
	video = get_object_or_404(Video, pk=pk)
	video.delete()
	messages.success(request, 'Video deleted',extra_tags='alert')
	return redirect('video_publish_list')
