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
	
	
	url(r'^userprofile/(?P<pk>[0-9]+)/active/$', views.profile_active, name='userprofile_active'),
	url(r'^userprofile/(?P<pk>[0-9]+)/delete/$', views.profile_delete, name='userprofile_delete'),
	
]