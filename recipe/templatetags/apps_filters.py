from django import template
from datetime import date, timedelta, datetime
from django.utils.timezone import is_aware, utc
from django.utils.translation import pgettext, ungettext
from django.template import defaultfilters
register = template.Library()


@register.filter(name='format_time')
def format_time(value):
    hours, rem = divmod(value.seconds, 3600)
    minutes, seconds = divmod(rem, 60)
    if minutes == 0:
    	return '{}min'.format(seconds)
    elif minutes>=1 and seconds>0:
    	return '{}h {}min'.format(minutes, seconds)
    else:
    	return '{}h'.format(minutes)



# hours, rem = divmod(value.seconds, 3600)
#     minutes, seconds = divmod(rem, 60)
#     if minutes == 0:
#     	return '{}h'.format(hours)
#     elif hours>=1 and minutes>0:
#     	return '{}h {}min'.format(hours, minutes)
#     else:
#   	return '{}min'.format(minutes)

@register.filter
def naturaltimez(value):
    """
    For date and time values shows how many seconds, minutes or hours ago
    compared to current timestamp returns representing string.
    """
    if not isinstance(value, date): # datetime is a subclass of date
        return value
 
    now = datetime.now(utc if is_aware(value) else None)
    if value < now:
        delta = now - value
        if delta.days >= 30:
            count = delta.days // 30
            return ungettext(
                '1 mois', '%(count)s mois', count
            ) % {'count': count}
        if delta.days != 0:
            count = delta.days 
            return ungettext(
                '1 jour', '%(count)s jours', count
            ) % {'count': count}
        elif delta.seconds == 0:
            return _('now')
        elif delta.seconds < 60:
            return ungettext(
                'une seconde', '%(count)s secondes', delta.seconds
            ) % {'count': delta.seconds}
        elif delta.seconds // 60 < 60:
            count = delta.seconds // 60
            return ungettext(
                'une minute', '%(count)s minutes', count
            ) % {'count': count}
        else:
            count = delta.seconds // 60 // 60
            return ungettext(
                'une heure', '%(count)s heures', count
            ) % {'count': count}
    else:
        delta = value - now
        if delta.days != 0:
            return pgettext(
                'naturaltime', '%(delta)s'
            ) % {'delta': defaultfilters.timeuntil(value, now)}
        elif delta.seconds == 0:
            return _('now')
        elif delta.seconds < 60:
            return ungettext(
                'une seconde', '%(count)s secondes', delta.seconds
            ) % {'count': delta.seconds}
        elif delta.seconds // 60 < 60:
            count = delta.seconds // 60
            return ungettext(
                'une minute', '%(count)s minutes', count
            ) % {'count': count}
        else:
            count = delta.seconds // 60 // 60
            return ungettext(
                'une heure', '%(count)s heures', count
            ) % {'count': count}
