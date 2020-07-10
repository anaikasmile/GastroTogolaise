#!/usr/bin/env python
# -*- coding: utf-8 -*-
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
from django.conf.urls import url,include
from django.contrib import admin
from django.contrib.auth import views
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles import views
from django_filters.views import FilterView
from django.contrib.flatpages import views
from userprofile import views as userprofile
from django.views.generic import TemplateView

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^pages/', include('django.contrib.flatpages.urls')),

    url('about/', views.flatpage, {'url': '/about/'}, name='about'),

    url('legacy/', views.flatpage, {'url': '/legacy/'}, name='legacy'),

    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^comments/', include('django_comments.urls')),
    url(r'^ratings/', include('star_ratings.urls', namespace='ratings', app_name='ratings')),

    #url(r'^accounts/password/change/$', userprofile.login_after_password_change,
    #name='account_change_password'), 
    url(r'^accounts/', include('allauth.urls')),

    url(r'^userprofile/', include('userprofile.urls')),
    url(r'^restaurant/', include('restaurant.urls')),
    url(r'', include('recipe.urls')),
    url(r'^blog/', include('blog.urls')),
    url(r'^datetimepicker/', include('datetimepicker.urls')),
    url(r'^search/', include('search.urls')),
    url(r'^notifications/', include('notify.urls', 'notifications')),
    url(r'^select2/', include('django_select2.urls')),
    url(r'^newsletter/', include('newsletter.urls')),
    url(r'^robots\.txt$', TemplateView.as_view(template_name="gastronomie/robots.txt", content_type='text/plain')),

]+ static(
        settings.STATIC_URL,
        document_root=settings.STATIC_ROOT
        )+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

