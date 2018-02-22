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
from django.conf import settings
from django.conf.urls.static import static
from . import views
urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^recipe/$', views.recipe_list, name='recipe_list'),
    url(r'^recipe/category/(?P<pk>[0-9]+)/$', views.recipe_per_cat, name='recipe_per_cat'),
    url(r'^recipe/contributor/(?P<pk>[0-9]+)/$', views.recipe_per_contributor, name='recipe_per_contributor'),
    url(r'^recipe/detail/(?P<pk>[0-9]+)/$', views.recipe_detail, name='recipe_detail'),
    url(r'^recipe/like/$',views.like, name='recipe_like'),
    url(r'^recipe/add/$', views.recipe_add, name='recipe_add'),

    url(r'^recipe/user/box/$', views.recipe_box_user, name='recipe_box_user'),


    url(r'^video', views.video_list, name='video_list'),
    url(r'^video/detail/(?P<pk>[0-9]+)/$', views.video_detail, name='video_detail'),
    url(r'^video/view', views.video_view, name='video_view'),

    url(r'^video/like/$',views.like, name='video_like'),
    
    



    url(r'^dashboard/$', views.stats, name='stats'),
    url(r'^recipe/draft/list/$', views.recipe_draft_list, name='recipe_draft_list'),
    url(r'^recipe/publish/list/$', views.recipe_publish_list, name='recipe_publish_list'),
    url(r'^recipe/preview/(?P<pk>[0-9]+)/$', views.recipe_preview, name='recipe_preview'),
    url(r'^recipe/(?P<pk>[0-9]+)/publish/$', views.recipe_publish, name='recipe_publish'),
    url(r'^recipe/(?P<pk>[0-9]+)/delete/$', views.recipe_delete, name='recipe_delete'),
    url(r'^recipe/(?P<pk>[0-9]+)/update/$', views.recipe_update, name='recipe_update'),
    url(r'^recipe/new/$', views.recipe_new, name='recipe_new'),

    url(r'^video/new/$', views.video_new, name='video_new'),
    url(r'^video/preview/(?P<pk>[0-9]+)/$', views.video_preview, name='video_preview'),   
    url(r'^video/(?P<pk>[0-9]+)/edit/$', views.video_edit, name='video_update'),
    url(r'^video/draft/list/$', views.video_draft_list, name='video_draft_list'),
    url(r'^video/publish/list/$', views.video_publish_list, name='video_publish_list'), 
    url(r'^video/(?P<pk>[0-9]+)/publish/$', views.video_publish, name='video_publish'),
    url(r'^video/(?P<pk>[0-9]+)/delete/$', views.video_delete, name='video_delete'),

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
