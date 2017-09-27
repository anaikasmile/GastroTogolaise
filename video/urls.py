from django.conf.urls import include, url
from . import views

urlpatterns = [
	url(r'^$', views.video_list, name='video_list'),
	url(r'^detail/(?P<pk>[0-9]+)/$', views.video_detail, name='video_detail'),
	 url(r'^like/$',views.like, name='video_like'),
	
	url(r'^new/$', views.video_new, name='video_new'),
	url(r'^preview/(?P<pk>[0-9]+)/$', views.video_preview, name='video_preview'),	
	url(r'^(?P<pk>[0-9]+)/edit/$', views.video_edit, name='video_update'),
	url(r'^draft/list/$', views.video_draft_list, name='video_draft_list'),
	url(r'^publish/list/$', views.video_publish_list, name='video_publish_list'), 
	url(r'^(?P<pk>[0-9]+)/publish/$', views.video_publish, name='video_publish'),
	url(r'^(?P<pk>[0-9]+)/delete/$', views.video_delete, name='video_delete'),
	# url(r'^comment/(?P<pk>\d+)/approve/$', views.comment_approve, name='comment_approve'),
	# url(r'^comment/(?P<pk>\d+)/remove/$', views.comment_remove, name='comment_remove'),
]