
from .base import *
 


DATABASES = {'default': dj_database_url.config(default="postgresql-angular-86634")}

ALLOWED_HOSTS = ['*']


# Application definition
SITE_ID = 3


STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'   


#Files storages
AWS_STATIC_STORAGE_BUCKET_NAME = 'tgcook'
AWS_STORAGE_BUCKET_NAME = 'tgcook'

AWS_ACCESS_KEY_ID = 'AKIAIOWSHLAWROUESPLQ'
AWS_SECRET_ACCESS_KEY = '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'
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME


AWS_S3_OBJECT_PARAMETERS = {
    'CacheControl': 'max-age=86400',
}

#STATICFILES_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
S3_URL = 'http://%s.s3.amazonaws.com/' % AWS_STORAGE_BUCKET_NAME
#STATIC_URL = S3_URL
MEDIA_URL = 'http://%s.s3.amazonaws.com/' % AWS_STORAGE_BUCKET_NAME

DEFAULT_FILE_STORAGE = "storages.backends.s3boto.S3BotoStorage"



ADMIN_MEDIA_PREFIX = STATIC_URL + 'admin/'


