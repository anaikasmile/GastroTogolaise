from django.contrib.auth.models import User
from recipe.models import Recipe, Category, Video
from blog.models import Post
from django.shortcuts import render
from .filters import CategoryFilter, RecipeFilter


from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Q
from django.http import JsonResponse
from django.views.generic import ListView

from taggit.models import Tag


class SearchListView(ListView):
    """CBV to contain all the search results"""
    model = Recipe
    template_name = "search/search.html"

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)

        query = self.request.GET.get("query")
        context ['word'] = query
        context["active"] = 'recipes'
        #context["hide_search"] = True
        context["tags_list"] = Tag.objects.filter(name=query)
        context["recipes"] = Recipe.objects.filter(Q(
            title__icontains=query) | Q(description__icontains=query) | Q(category__name__icontains=query) | Q(
                tags__name__icontains=query), published_at__isnull=False)
        context["videos"] = Video.objects.filter(Q(
            title__icontains=query) | Q(description__icontains=query) | Q(category__name__icontains=query)  | Q(
                tags__name__icontains=query), published_at__isnull=False)

        context["posts"] = Post.objects.filter(Q(
            title__icontains=query) | Q(text__icontains=query) | Q(category__name__icontains=query) | Q(
                tags__name__icontains=query), published_at__isnull=False)
        #context["users_list"] = get_user_model().objects.filter(
           # Q(username__icontains=query) | Q(
            #    name__icontains=query))
        context["recipes_count"] = context["recipes"].count()
        context["posts_count"] = context["posts"].count()
        context["videos_count"] = context["videos"].count()
        #context["users_count"] = context["users_list"].count()
        context["tags_count"] = context["tags_list"].count()
        context["total_results"] = context["recipes_count"] + \
            context["posts_count"] + context["videos_count"] + \
            context["tags_count"]
        return context


# # For autocomplete suggestions
# @login_required
# @ajax_required
# def get_suggestions(request):
#     # Convert users, articles, questions objects into list to be
#     # represented as a single list.
#     query = request.GET.get('term', '')
#     users = list(get_user_model().objects.filter(
#         Q(username__icontains=query) | Q(name__icontains=query)))
#     articles = list(Article.objects.filter(
#         Q(title__icontains=query) | Q(content__icontains=query) | Q(
#             tags__name__icontains=query), status="P"))
#     questions = list(Question.objects.filter(Q(title__icontains=query) | Q(
#         content__icontains=query) | Q(tags__name__icontains=query)))
#     # Add all the retrieved users, articles, questions to data_retrieved
#     # list.
#     data_retrieved = users
#     data_retrieved.extend(articles)
#     data_retrieved.extend(questions)
#     results = []
#     for data in data_retrieved:
#         data_json = {}
#         if isinstance(data, get_user_model()):
#             data_json['id'] = data.id
#             data_json['label'] = data.username
#             data_json['value'] = data.username

#         if isinstance(data, Article):
#             data_json['id'] = data.id
#             data_json['label'] = data.title
#             data_json['value'] = data.title

#         if isinstance(data, Question):
#             data_json['id'] = data.id
#             data_json['label'] = data.title
#             data_json['value'] = data.title

#         results.append(data_json)

#     return JsonResponse(results, safe=False)
