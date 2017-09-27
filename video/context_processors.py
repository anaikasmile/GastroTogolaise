from video.models import Video
from django.shortcuts import get_object_or_404
from django.db.models import F

# Liste les 4 dernieres publications
def video_lasted(request):	
	return {'lastvideos': Video.objects.filter(published_at__isnull=False).filter(view__gt=0).order_by(F('view').desc())[:3]}


