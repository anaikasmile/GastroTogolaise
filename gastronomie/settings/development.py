from .base import *
 

# Database
#https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', 
        'NAME': 'cook_db', 
        'USER': 'root', 
        'PASSWORD': 'root', 
        'HOST': 'localhost', 
        'PORT': '', 
    }
}