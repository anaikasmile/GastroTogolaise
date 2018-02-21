from django.contrib import admin

# Register your models here.
# Register your models here.
from blog.models import Post, Category
admin.site.register(Category)
admin.site.register(Post)
