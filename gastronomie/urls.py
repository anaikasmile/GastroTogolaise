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


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^pages/', include('django.contrib.flatpages.urls')),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^comments/', include('django_comments.urls')),
    url(r'^ratings/', include('star_ratings.urls', namespace='ratings', app_name='ratings')),
	
    url(r'^accounts/', include('allauth.urls')), 
    # ajout du 06/6/18
    url(r'^password/change', auth_views.PasswordChangeView.as_view(template_name='account/password_change.html',success_url='/dashboard/accueil'),name='password_change'),
    url(r'^password/change/done/$',auth_views.password_change_done,name='password_change_done'),
    url(r'^password/reset/$',auth_views.PasswordResetView.as_view(template_name='account/password_reset.html',success_url='/account/login'),name='password_reset'),
    url(r'^password/reset/done/$',auth_views.PasswordResetDoneView.as_view(template_name='account/password_reset_done.html'),name='password_reset_done'),
    url(r'^password/reset/complete/$',auth_views.PasswordResetCompleteView.as_view(template_name='account/password_reset_from_key.html'),name='password_reset_complete'),
    # fin ajout


    url(r'^userprofile/', include('userprofile.urls')),
    url(r'^restaurant/', include('restaurant.urls')),
    url(r'', include('recipe.urls')),
    url(r'^blog/', include('blog.urls')),
    url(r'^datetimepicker/', include('datetimepicker.urls')),
    url(r'^search/', include('search.urls')),
   
]+ static(
        settings.STATIC_URL,
        document_root=settings.STATIC_ROOT
        )+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
