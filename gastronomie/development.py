# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

SECRET_KEY = '#l3#%g^k@g9wjtsnzkwce-7uy92_%1x=)gt%t_o_+fd!7%g($3'

#DEBUG = config('DEBUG', default=False, cast=bool)

DEBUG = True

#DATABASES = {'default': dj_database_url.config(default="postgres://qfshiulqbogrll:11e2a4a020aaca0707ecf132d0a0685caf76a7cb07feb6383a44771377fe8804@ec2-54-221-212-208.compute-1.amazonaws.com:5432/dfqktli8ama0hd")}

ALLOWED_HOSTS = ['*']


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', 
        'NAME': 'cookit_db', 
        'USER': 'cookit_user', 
        'PASSWORD': 'cookit_user', 
        'HOST': 'localhost', 
        'PORT': '', 
    }
}

# Application definition
SITE_ID = 2