from django.contrib import admin

# Register your models here.
from recipe.models import Category, Recipe
admin.site.register(Category)
admin.site.register(Recipe)
