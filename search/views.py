from django.contrib.auth.models import User
from recipe.models import Recipe, Category, Video

from django.shortcuts import render
from .filters import CategoryFilter, RecipeFilter

def search(request):
    recipe_list = Recipe.objects.all()
    recipe_filter = RecipeFilter(request.GET, queryset=recipe_list)
    return render(request, 'search/search.html', {'filter': recipe_filter})