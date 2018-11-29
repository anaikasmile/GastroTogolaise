"""gastronomie URL Configuration
The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.contrib.auth import views
from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
                  url(r'^$', views.restaurant_list, name='restaurant_list'),
                  url(r'^category/(?P<slug>[-\w]+)/$', views.restaurant_per_cat, name='restaurant_per_cat'),
                  url(r'^catering$', views.traiteur_list, name='catering_list'),

                  url(r'^new/$', views.restaurant_new, name='restaurant_new'),
                  url(r'^liste/$', views.restaurant_publish_list, name='restaurant_publish_list'),
                  url(r'^restaurant/preview/(?P<slug>[-\w]+)/$', views.restaurant_preview, name='restaurant_preview'),
                  url(r'^(?P<slug>[-\w]+)/delete/$', views.restaurant_delete, name='restaurant_delete'),
                  url(r'^(?P<slug>[-\w]+)/update/$', views.restaurant_update, name='restaurant_update'),
                  url(r'^(?P<slug>[-\w]+)/publish/$', views.restaurant_publish, name='restaurant_publish'),

                  url(r'^new/category$', views.restaurant_new_category, name='restaurant_new_categ'),
                  url(r'^(?P<slug>[-\w]+)/category/edit/$', views.restaurant_category_update, name='restaurant_category_update'),
                  url(r'^(?P<slug>[-\w]+)/category/delete/$', views.restaurant_category_delete, name='restaurant_category_delete'),

              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)