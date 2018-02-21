from restaurant.models import Restaurant, Category
from django.shortcuts import get_object_or_404
from django.db.models import F

# Liste les 4 dernieres publications


def restaurant_category(request):
	return {'restaurant_categories':Category.objects.all()[:5]}