from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect, Http404, JsonResponse
from django.template import RequestContext
from django.template.loader import render_to_string
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.utils import timezone
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from .models import Video
from .forms import VideoForm


def pagination(request,fichier):
    paginator = Paginator(fichier,6)

    page = request.GET.get('page')
    try:
        p = paginator.page(page)

    except PageNotAnInteger:

        p = paginator.page(1)

    except EmptyPage:

        p = paginator.page(paginator.num_pages)

    return p

def video_list(request):
	videos = Video.objects.all().order_by('-published_at')
	videos = pagination(request, videos)
	return render(request,'video/video_list.html',{'videos':videos})


def video_detail(request,pk):
	video = get_object_or_404(Video, pk=pk)
	video.view = video.view+1 #Incrementer le nombre de vue 
	video_author = Video.objects.filter(published_at__isnull=False).order_by('-published_at').filter(author=video.author).exclude(pk=video.pk)
	# page = request.GET.get('page', 1)
	# paginator = Paginator(video_author, 3)
	# try:
	# 	video_author = paginator.page(page)
	# except PageNotAnInteger:
	# 	video_author = paginator.page(1)
	# except EmptyPage:
	# 	video_author = paginator.page(paginator.num_pages)
	return render(request, 'video/video_detail.html',{'video':video, 'video_author':'video_author'})

# Liker une recette
def like(request):
	if request.method =='GET':
		video_pk  = request.GET['video_pk']
		r = Video.objects.get(pk=video_pk)
		like = r.like + 1
		r.like = like
		r.save()
	return HttpResponse(like)




def video_new(request):
	if request.method == "POST":

		form = VideoForm(request.POST)
		if form.is_valid():
			video = form.save(commit=False)
			video.author = request.user
			video.save()
			return redirect ('video_preview',pk=video.pk)
	else:
		form = VideoForm()
	return render(request, 'video/video_new.html',{'form':form})

#@login_required
def video_edit(request,pk):
	video = get_object_or_404(Video, pk=pk)
	if request.method == "POST":
		form = VideoForm(request.POST, instance=video)
		if form.is_valid():
			video = form.save(commit=False)
			video.save()
			messages.success(request, 'Video updated',extra_tags='alert')
		return redirect('video_preview', pk=video.pk)
	else:
		form = VideoForm(instance=video)
	return render(request, 'video/video_new.html', {'form': form})


# Apercu
def video_preview(request,pk):
	video = get_object_or_404(Video, pk=pk)
	return render(request, 'video/video_preview.html',{'video':video})


#@login_required
def video_draft_list(request):
	videos = Video.objects.filter(published_at__isnull=True).order_by('published_at')
	return render(request,'video/video_draft_list.html',{'videos':videos})

#@login_required
def video_publish_list(request):
	videos = Video.objects.filter(published_at__isnull=False).order_by('published_at')
	return render(request,'video/video_publish_list.html',{'videos':videos})


#@login_required
def video_publish(request, pk):
    video = get_object_or_404(Video, pk=pk)
    video.publish()
    messages.success(request, 'Your video was published!',extra_tags='alert')
    return redirect('video_draft_list')

# @login_required
def video_delete(request,pk):
	video = get_object_or_404(Video, pk=pk)
	video.delete()
	messages.success(request, 'Video deleted',extra_tags='alert')
	return redirect('video_publish_list')

