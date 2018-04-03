from django import forms
from .models import Recipe, Video, Origin
from django.forms import SelectDateWidget, SplitDateTimeField
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone
from django.contrib.auth.models import User
from datetimewidget.widgets import DateTimeWidget
from datetimepicker.widgets import DateTimePicker
from datetimepicker.helpers import js_loader_url

class RecipeForm(forms.ModelForm):
    class Meta:
        model = Recipe
        fields = ['category','title','origin','description','prepare_time','cooking_time','ingredient','preparation','image','image_1','image_2','image_3','tags']
        widgets = {
            'category':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'origin':forms.SelectMultiple(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'title':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'description':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),
            'cooking_time':forms.TimeInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'prepare_time': forms.TimeInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'ingredient':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'preparation':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            
            'image':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'image_1':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'image_2':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'image_3':forms.FileInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'input-file'}),
            'tags':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
           
            
            
            }
        

# RecipeFormSet = inlineformset_factory(Origin, Recipe,
#                                             form=RecipeForm, extra=1)


class VideoForm(forms.ModelForm):

    class Meta:
        model = Video
        fields = ('title', 'video','description','category','origin','tags')
        widgets = {
            'category':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'origin':forms.Select(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'title':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'description':forms.Textarea(attrs={'placeholder':_(u''),'name':'','id':'textArea','class':'form-control'}),
            'video':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
            'tags':forms.TextInput(attrs={'placeholder':_(u''),'name':'','id':'','class':'form-control'}),
           
            }
