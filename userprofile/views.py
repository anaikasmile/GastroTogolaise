from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.utils import timezone
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib import messages
from django.db import transaction
from django.contrib.auth.models import User, Group
from .models import Profile
from .forms import UserForm, ProfileForm, AdminForm
from django.contrib.admin.views.decorators import staff_member_required
from gastronomie.decorators import *

# Create your views here.

def admin_pagination(request,fichier):
    paginator = Paginator(fichier,15)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p

def pagination(request,fichier):
    paginator = Paginator(fichier,4)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p

@login_required
@transaction.atomic
def profile_update(request):
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, request.FILES, instance=request.user.profile)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, ('Your profile was successfully updated!'))
            return redirect('/')
        else:
            messages.error(request, ('Please correct the error below.'))
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'userprofile/profile_update.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })



def contributors(request):	
	users = User.objects.filter(groups = None).order_by('username')
	users = pagination(request, users)
	return render(request,'userprofile/contributors.html', {'users':users})

# @login_required
# def profile_box(request):
	
# 	return render(request,'userprofile/staff_list.html', {'users':users})





# Partie Admin

# Ajouter un membre au staff
@login_required
@staff_member_required
def profile_add(request):
    if request.method == 'POST':
        admin_form = AdminForm(request.POST)
        if admin_form.is_valid():
            admin_form.save()
            messages.success(request, ('Account was successfully created!'))
            return redirect('staff_list')
        else:
            messages.error(request, ('Please correct the error below.'))
    else:
        admin_form = AdminForm()
        
    return render(request, 'userprofile/profile_add.html', {
        'admin_form': admin_form,
        
    })

@login_required
@group_required('staff')
def staff_list(request):
	users = Group.objects.get(name="staff").user_set.all().order_by('username')
	# users = User.objects.filter(groups__name='admistrator').order_by('username')
	users = admin_pagination(request, users)
	return render(request,'userprofile/staff_list.html', {'users':users})


@login_required
@group_required('staff')
def contributor_list(request):	
	users = User.objects.filter(groups = None).order_by('username')
	users = admin_pagination(request, users)
	return render(request,'userprofile/contributor_list.html', {'users':users})

@login_required
@group_required('staff')
def profile_preview(request,pk):
	user = get_object_or_404(User, pk=pk)
	return render(request, 'userprofile/profile_preview.html',{'user':user})
