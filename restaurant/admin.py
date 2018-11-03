from django.contrib import admin

# Register your models here.
from restaurant.models import Restaurant, Category

admin.site.register(Restaurant)
admin.site.register(Category)