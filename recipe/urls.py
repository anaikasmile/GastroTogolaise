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
from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth import views
from django.conf import settings
from django.conf.urls.static import static
from django.urls import reverse
from . import views

urlpatterns = [
                  url(r'^$', views.home, name='home'),
                  url(r'^recipe/$', views.recipe_list, name='recipe_list'),
                  url(r'^recipe/category/(?P<slug>[-\w]+)/$', views.recipe_per_cat, name='recipe_per_cat'),
                  url(r'^recipe/tag/$', views.recipe_per_tag, name='recipe_tag'),
                  url(r'^recipe/origin/$', views.recipe_per_origin, name='recipe_origin'),
                  url(r'^recipe/contributor/(?P<pk>[0-9]+)/$', views.recipe_per_contributor,
                      name='recipe_per_contributor'),
                  url(r'^recipe/detail/(?P<slug>[-\w]+)/$', views.recipe_detail, name='recipe_detail'),
                  url(r'^recipe/like/$', views.like, name='recipe_like'),
                  url(r'^recipe/add/$', views.recipe_add, name='recipe_add'),
                  url(r'^origin/add/$', views.OriginAdd.as_view(), name='origin_add'),

                  url(r'^recipe/user/box/$', views.recipe_box_user, name='recipe_box_user'),

                  # ajout du 06/06/18
                  url(r'^recipe/new/category$', views.recipe_new_category, name='recipe_new_categ'),
                  url(r'^recipe/category/(?P<slug>[-\w]+)/delete/$', views.recipe_category_delete,
                      name='recipe_category_delete'),
                  url(r'^recipe/category/(?P<slug>[-\w]+)/update/$', views.recipe_category_update,
                      name='recipe_category_update'),
                  # fin ajout

                  url(r'^recipe/video', views.video_list, name='video_list'),
                  url(r'^video/tag/$', views.video_per_tag, name='video_tag'),
                  url(r'^video/detail/(?P<slug>[-\w]+)/$', views.video_detail, name='video_detail'),
                  url(r'^video/like/$', views.likevideo, name='video_like'),

                  url(r'^dashboard/$', views.stats, name='stats'),
                  url(r'^recipe/draft/list/$', views.recipe_draft_list, name='recipe_draft_list'),
                  url(r'^recipe/publish/list/$', views.recipe_publish_list, name='recipe_publish_list'),
                  url(r'^recipe/preview/(?P<slug>[-\w]+)/$', views.recipe_preview, name='recipe_preview'),
                  url(r'^recipe/(?P<slug>[-\w]+)/publish/$', views.recipe_publish, name='recipe_publish'),
                  url(r'^recipe/(?P<slug>[-\w]+)/delete/$', views.recipe_delete, name='recipe_delete'),
                  url(r'^recipe/(?P<slug>[-\w]+)/update/$', views.recipe_update, name='recipe_update'),
                  url(r'^recipe/new/$', views.recipe_new, name='recipe_new'),

                  url(r'^video/new/$', views.video_new, name='video_new'),
                  url(r'^video/preview/(?P<slug>[-\w]+)/$', views.video_preview, name='video_preview'),
                  url(r'^video/(?P<slug>[-\w]+)/edit/$', views.video_edit, name='video_update'),
                  url(r'^video/draft/list/$', views.video_draft_list, name='video_draft_list'),
                  url(r'^video/publish/list/$', views.video_publish_list, name='video_publish_list'),
                  url(r'^video/(?P<slug>[-\w]+)/publish/$', views.video_publish, name='video_publish'),
                  url(r'^video/(?P<slug>[-\w]+)/delete/$', views.video_delete, name='video_delete'),

                  url(r'^video/new/category$', views.video_new_category, name='video_new_categ'),
                  url(r'^video/category/(?P<slug>[-\w]+)/delete/$', views.video_category_delete,
                      name='video_category_delete'),
                  url(r'^video/category/(?P<slug>[-\w]+)/update/$', views.video_category_update,
                      name='video_category_update'),

              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
