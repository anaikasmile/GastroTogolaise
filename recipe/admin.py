from django.contrib import admin

# Register your models here.
from recipe.models import Category, Recipe, Origin, Video
admin.site.register(Category)
admin.site.register(Recipe)
admin.site.register(Origin)
admin.site.register(Video)