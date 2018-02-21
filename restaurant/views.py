from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404, JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django_comments.models import Comment


from .models import Restaurant, Category
from .forms import RestaurantForm
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
	#recipes = category.recipes.all().filter(published_at__isnull=False).order_by('-published_at')
	restaurants = Restaurant.objects.filter(category='Restaurant')
	restaurants = pagination(request, restaurants)

	return render(request,'restaurant/restaurant_list.html', {'restaurants':restaurants})

def traiteur_list(request):
	restaurants = Restaurant.objects.filter(category='Traiteur')
	restaurants = pagination(request, restaurants)
	return render(request,'restaurant/restaurant_list.html', {'restaurants':restaurants})

#Liste des addresses par categorie
def restaurant_per_cat(request,pk):
	category = get_object_or_404(Category, pk=pk)
	restaurants = category.addresses.all().filter(enabled='True')
	restaurants = pagination(request, restaurants)
	return render(request,'restaurant/restaurant_list.html', {'restaurants':restaurants, 'category_address':category})



""" Administration """

#Ajouter une recette
@login_required
# @group_required('staff')
def restaurant_add(request):
	if request.method == "POST":
		form = RestaurantForm(request.POST, request.FILES)
		if form.is_valid():
			restaurant.save()
			messages.success(request, 'Saved!',extra_tags='alert')
			return redirect ('restaurant_preview',pk=restaurant.pk)

	else:
		form = RestaurantForm()
	return render(request,'restaurant/restaurant_add.html', {'form':form})


#Modifier
@login_required
#@group_required('staff')
def restaurant_update(request,pk):
	restaurant = get_object_or_404(Restaurant, pk=pk)
	if request.method == "POST":
		form = RestaurantForm(request.POST,request.FILES, instance=restaurant)
		if form.is_valid():
			restaurant.save()
			messages.success(request, 'updated',extra_tags='alert')
		return redirect('restaurant_preview', pk=restaurant.pk)
	else:
		form = RestaurantForm(instance=restaurant)
	return render(request, 'restaurant/restaurant_update.html', {'form': form})


#Supprimer
@login_required
def restaurant_delete(request,pk):
	restaurant = get_object_or_404(Restaurant, pk=pk)
	restaurant.delete()
	messages.success(request, 'deleted',extra_tags='alert')	
	return redirect('')


#Liste de tous les bons plans
def restaurant_publish_list(request):
	restaurants = Restaurant.objects.filter(category='Restaurant')
	restaurants = pagination(request, restaurants)
	return render(request,'restaurant/restaurant_publish_list.html', {'restaurants':restaurants})
