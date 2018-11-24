#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles import views
from . import views

urlpatterns = [
	url(r'^$', views.post_list, name='post_list'),
	url(r'^category/(?P<pk>[0-9]+)/$', views.post_per_cat, name='post_per_cat'),
	url(r'^tag/$', views.post_per_tag, name='post_tag'),
	url(r'^detail/(?P<slug>[-\w]+)/$', views.post_detail, name='post_detail'),
	url(r'^like/$',views.like, name='post_like'),

    url(r'^new/category$', views.post_new_category, name='post_new_categ'),
    url(r'^(?P<slug>[-\w]+)/category/edit/$', views.post_category_update, name='post_category_update'),
    url(r'^(?P<slug>[-\w]+)/category/delete/$', views.post_category_delete, name='post_category_delete'),


	url(r'^new/$', views.post_new, name='post_new'),
	url(r'^preview/(?P<slug>[-\w]+)/$', views.post_preview, name='post_preview'),
	url(r'^(?P<slug>[-\w]+)/update/$', views.post_update, name='post_update'),
	url(r'^draft/list/$', views.post_draft_list, name='post_draft_list'),
	url(r'^publish/list/$', views.post_publish_list, name='post_publish_list'),
	url(r'^(?P<slug>[-\w]+)/publish/$', views.post_publish, name='post_publish'),
	url(r'^(?P<slug>[-\w]+)/delete/$', views.post_delete, name='post_delete'),
	# url(r'^comment/(?P<pk>\d+)/approve/$', views.comment_approve, name='comment_approve'),
	# url(r'^comment/(?P<pk>\d+)/remove/$', views.comment_remove, name='comment_remove'),
]+ static(
        settings.STATIC_URL,
        document_root=settings.STATIC_ROOT
        )+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)