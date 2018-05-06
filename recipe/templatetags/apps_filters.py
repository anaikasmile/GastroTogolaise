from django import template
from datetime import date, timedelta

register = template.Library()


@register.filter(name='format_time')
def format_time(value):
    hours, rem = divmod(value.seconds, 3600)
    minutes, seconds = divmod(rem, 60)
    if minutes == 0:
    	return '{}h'.format(hours)
    elif hours>=1 and minutes>0:
    	return '{}h {}min'.format(hours, minutes)
    else:
    	return '{}min'.format(minutes)