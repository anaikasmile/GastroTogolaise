#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

from . base import *

#DEBUG = config('DEBUG', default=False, cast=bool)

DEBUG = True

#DATABASES = {'default': dj_database_url.config(default="postgres://qfshiulqbogrll:11e2a4a020aaca0707ecf132d0a0685caf76a7cb07feb6383a44771377fe8804@ec2-54-221-212-208.compute-1.amazonaws.com:5432/dfqktli8ama0hd")}

ALLOWED_HOSTS = ['*']


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

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
    os.path.join(BASE_DIR, 'media'),
    '/home/togokuizine/lib/python2.7/site-packages/django/contrib/admin/static',
    #'/home/sonia/Venv/lib/python3.5/site-packages/django/contrib/admin/static/admin',
)

# Application definition
SITE_ID = 2


EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'gastronomie.togolaise@gmail.com'
EMAIL_HOST_PASSWORD = 'gastronomie.togolaise_2017'
EMAIL_PORT = 587