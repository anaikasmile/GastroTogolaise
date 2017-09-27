from django.conf.urls import include, url
from . import views

urlpatterns = [
	url(r'^$', views.contributors, name='contributors'),
	# url(r'^userprofile/detail/(?P<pk>[0-9]+)/$', views.userprofile_detail, name='userprofile_detail'),
	# url(r'^userprofile/like/$',views.like, name='userprofile_like'),
	
	url(r'^add/$', views.profile_add, name='userprofile_add'),
	url(r'^preview/(?P<pk>[0-9]+)/$', views.profile_preview, name='userprofile_preview'),	
	url(r'^edit/$', views.profile_update, name='userprofile_update'),
	url(r'^staff/list/$', views.staff_list, name='staff_list'),
	url(r'^contributor/list/$', views.contributor_list, name='contributor_list'),
	

	# url(r'^userprofile/publish/list/$', views.userprofile_publish_list, name='userprofile_publish_list'), 
	# url(r'^userprofile/(?P<pk>[0-9]+)/publish/$', views.userprofile_publish, name='userprofile_publish'),
	# url(r'^userprofile/(?P<pk>[0-9]+)/delete/$', views.userprofile_delete, name='userprofile_delete'),
	# # url(r'^comment/(?P<pk>\d+)/approve/$', views.comment_approve, name='comment_approve'),
	# url(r'^comment/(?P<pk>\d+)/remove/$', views.comment_remove, name='comment_remove'),
]