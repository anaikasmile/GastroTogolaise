from django import forms
from .models import Video

class VideoForm(forms.ModelForm):

	class Meta:
		model = Video
		fields = ('title', 'video',)


# class CommentForm(forms.ModelForm):

# 	class Meta:
# 		model = Comment
# 		fields = ('text','author',)