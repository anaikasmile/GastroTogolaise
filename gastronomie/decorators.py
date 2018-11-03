from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth import REDIRECT_FIELD_NAME

def group_required(*group_names):
    """Requires user membership in at least one of the groups passed in."""
    def in_groups(u):
        if u.is_authenticated():
            if bool(u.groups.filter(name__in=group_names)) | u.is_superuser:
                return True
        return False
    return user_passes_test(in_groups)



def staff_required(function=None, redirect_field_name=REDIRECT_FIELD_NAME, login_url='login'):
	'''
	Decorator for views that checks that the logged in user is a student,
	redirects to the log-in page if necessary.
	'''
	actual_decorator = user_passes_test(
		lambda u: u.is_active and u.is_staff_member,
		login_url=login_url,
		redirect_field_name=redirect_field_name
	)
	if function:
		return actual_decorator(function)
	return actual_decorator