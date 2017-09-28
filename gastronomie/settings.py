"""
Django settings for gastronomie project.

Generated by 'django-admin startproject' using Django 1.10.7.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.10/ref/settings/
"""

import os
import tempfile
import dj_database_url

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '#l3#%g^k@g9wjtsnzkwce-7uy92_%1x=)gt%t_o_+fd!7%g($3'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition
SITE_ID = 2

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'django.contrib.humanize',
    'django.contrib.flatpages',
    'widget_tweaks',
    'sorl.thumbnail',
    'ckeditor',
    'threadedcomments',
    'django_comments',
    #'ckeditor_uploader',
    #'secretballot',
    # 'likes',
    'star_ratings',
    'embed_video',
    'allauth',  
    'allauth.account',
    'allauth.socialaccount',
    'allauth.socialaccount.providers.google',
    'allauth.socialaccount.providers.facebook',
    # 'allauth.socialaccount.providers.twitter',
    'recipe',
    'blog',
    'video',
    'userprofile',
    'restaurant',
    
]

COMMENTS_APP = 'threadedcomments'

STAR_RATINGS_ANONYMOUS = True
STAR_RATINGS_RANGE = 5
STAR_RATINGS_STAR_HEIGHT = 20
STAR_RATINGS_STAR_WIDTH = 20

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    #'likes.middleware.SecretBallotUserIpUseragentMiddleware',
]
AUTHENTICATION_BACKENDS = [
    # Needed to login by username in Django admin, regardless of `allauth`
    'django.contrib.auth.backends.ModelBackend',
    # `allauth` specific authentication methods, such as login by e-mail
    'allauth.account.auth_backends.AuthenticationBackend',
]

SOCIALACCOUNT_PROVIDERS = \
    {'facebook':
       {'METHOD': 'oauth2',
        'SCOPE': ['email','public_profile', 'user_friends'],
        'AUTH_PARAMS': {'auth_type': 'reauthenticate'},
        'FIELDS': [
            'id',
            'email',
            'name',
            'first_name',
            'last_name',
            'verified',
            'locale',
            'timezone',
            'link',
            'gender',
            'updated_time'],
        'EXCHANGE_TOKEN': True,
        'LOCALE_FUNC': lambda request: 'kr_KR',
        'VERIFIED_EMAIL': False,
        'VERSION': 'v2.4'}
        }

ROOT_URLCONF = 'gastronomie.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS':[os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'recipe.context_processors.categories',
                'recipe.context_processors.toprecipes',
                'blog.context_processors.post_lasted',
                'video.context_processors.video_lasted',
                
            ],
        },
    },
]

WSGI_APPLICATION = 'gastronomie.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    # 'default': {
    #     'ENGINE': 'django.db.backends.postgresql_psycopg2', 
    #     'NAME': 'gastro_db', 
    #     'USER': 'admin', 
    #     'PASSWORD': 'root', 
    #     'HOST': 'localhost', 
    #     'PORT': '', 
    # }
    'default': dj_database_url.config(
        default=config('postgresql-deep-18681')
    )
    # 'default': dj_database_url.config(
    #       default='sqlite:////{0}'.format(os.path.join(BASE_DIR, 'db.sqlite3'))
    #   )

}


# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

#Login
ACCOUNT_USERNAME_REQUIRED = False
ACCOUNT_EMAIL_VERIFICATION = "none"
SOCIALACCOUNT_QUERY_EMAIL = True
LOGIN_REDIRECT_URL = "/"


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR,'staticfiles')

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR,'media')


STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'gastronomie/static'),
    os.path.join(BASE_DIR, 'media'),
    
)

STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'   

EMBED_VIDEO_BACKENDS = (
    'embed_video.backends.YoutubeBackend',
    'embed_video.backends.VimeoBackend',
    'embed_video.backends.SoundCloudBackend',
    # 'video.backends.CustomBackend',
)

# TINYMCE_JS_URL = os.path.join(MEDIA_URL, "tiny_mce/tiny_mce.js")
# TINYMCE_JS_ROOT = os.path.join(MEDIA_ROOT, "tiny_mce")
# TINYMCE_DEFAULT_CONFIG = {
#     'plugins': "table,spellchecker,paste,searchreplace",
#     'theme': "advanced",
#     'cleanup_on_startup': True,
#     'custom_undo_redo_levels': 10,
# }
# TINYMCE_SPELLCHECKER = True
# TINYMCE_COMPRESSOR = True

CKEDITOR_CONFIGS = {
    'default': {
        "removePlugins": "stylesheetparser",
        'toolbar': 'full',
        'height': 300,
        'width': 600,
    },
}

AWS_QUERYSTRING_AUTH = False
CKEDITOR_UPLOAD_PATH = "uploads/"
CKEDITOR_IMAGE_BACKEND = "pillow"
CKEDITOR_JQUERY_URL = '//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'

THUMBNAIL_FORCE_OVERWRITE = True
THUMBNAIL_QUALITY = 60
THUMBNAIL_PROGRESSIVE = False
THUMBNAIL_DEBUG = True
THUMBNAIL_BACKEND = 'sorl.thumbnail.base.ThumbnailBackend'
THUMBNAIL_KVSTORE = 'sorl.thumbnail.kvstores.cached_db_kvstore.KVStore'


from django.contrib.messages import constants as messages

MESSAGE_TAGS = {
    messages.DEBUG: 'alert-info',
    messages.INFO: 'alert-info',
    messages.SUCCESS: 'alert-success',
    messages.WARNING: 'alert-warning',
    messages.ERROR: 'alert-danger',
}



