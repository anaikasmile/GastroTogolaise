from django import template
from datetime import date, timedelta

register = template.Library()


@register.filter(name='format_time')
def format_time(value):
    hours, rem = divmod(value.seconds, 3600)
    minutes, seconds = divmod(rem, 60)
    if hours == 0:
    	return '{}min'.format(minutes)
    else:
    	return '{}h {}min'.format(hours, minutes)
