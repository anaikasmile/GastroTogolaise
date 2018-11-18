#!/usr/bin/env python
# -*- coding: utf-8 -*-
from .base import *
 

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'togokuizine_db',
        'USER': 'togokuizine_user',
        'PASSWORD': 'togokuizine@n4n85fgh',
        'HOST': 'localhost',
        'PORT': '',
    }
}

ALLOWED_HOSTS = ['*']


DEBUG = False


STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'   


EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'gastronomie.togolaise@gmail.com'
EMAIL_HOST_PASSWORD = 'gastronomie.togolaise_2017'
EMAIL_PORT = 587






