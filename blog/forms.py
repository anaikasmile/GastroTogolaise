from django import forms
from .models import Post
from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone
from django.contrib.auth.models import User
from ckeditor.widgets import CKEditorWidget

class PostForm(forms.ModelForm):

	class Meta:
		model = Post
		fields = ('title', 'text', 'image',)
		widgets = {
            'title':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'text':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),    
            'image':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            
            }

# class CommentForm(forms.ModelForm):

# 	class Meta:
# 		model = Comment
# 		fields = ('text','author',)