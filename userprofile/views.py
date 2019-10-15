#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.utils import timezone
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib import messages
from django.db import transaction
from django.contrib.auth.models import User, Group
from .models import Profile, User
from .forms import UserForm, ProfileForm, AdminForm
from django.contrib.auth.forms import UserCreationForm

from django.contrib.admin.views.decorators import staff_member_required
from gastronomie.decorators import *
from allauth.account.views import PasswordChangeView
from django.core.urlresolvers import reverse_lazy


# Create your views here.
class LoginAfterPasswordChangeView(PasswordChangeView):
    @property
    def success_url(self):
        return reverse_lazy('account_login')

login_after_password_change = login_required(LoginAfterPasswordChangeView.as_view())


def admin_pagination(request, fichier):
    paginator = Paginator(fichier, 15)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p


def pagination(request, fichier):
    paginator = Paginator(fichier, 6)

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

            messages.success(request, ('Votre profile a été mis à jour.'))
            return redirect('recipe_box_user')
        else:
            messages.error(request, ('Une erreur s' / 'est produite'))
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'userprofile/profile_update.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })


def contributors(request):
    users = User.objects.filter(is_contributor=True).exclude(is_staff_member=True)
    users = pagination(request, users)
    return render(request, 'userprofile/contributors.html', {'users': users})


# Partie Admin

# Ajouter un membre au staff
@login_required
@staff_required
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
@staff_required
def staff_list(request):
    users = User.objects.filter(is_staff_member=True)
    users = admin_pagination(request, users)
    return render(request, 'userprofile/staff_list.html', {'users': users})


@login_required
@staff_required
def contributor_list(request):
    users = User.objects.filter(is_contributor=True).exclude(is_staff_member=True)
    users = admin_pagination(request, users)
    return render(request, 'userprofile/contributor_list.html', {'users': users})


@login_required
@staff_required
def profile_preview(request, pk):
    user = get_object_or_404(User, pk=pk)
    return render(request, 'userprofile/profile_preview.html', {'user': user})


@login_required
@staff_member_required
def profile_active(request, pk):
    user = get_object_or_404(User, pk=pk)
    if (user.is_active):
        user.is_active = False
        user.save()
        messages.success(request, 'Compte désactivé!')
    else:
        user.is_active = True
        user.save()
        messages.success(request, 'Compte activé!')

    return redirect ('contributor_list')


# Supprimer
@login_required
@staff_required
def profile_delete(request, pk):
    user = get_object_or_404(User, pk=pk)
    user.delete()
    user.success(request, 'Utilisateur supprimé')
    return redirect('')