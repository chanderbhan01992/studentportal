"""
Django settings for studentportal project.

Generated by 'django-admin startproject' using Django 1.8.4.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'uics1l*7tnrwc0#wl705d4tluz@bn!-qxh$^qcsz(*qdl7z4zr'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
TEMPLATE_DEBUG=DEBUG

ALLOWED_HOSTS = ['127.0.0.1',
                 '192.168.2.79',
                 '0.0.0.0',
                 'studentportal.vnit.ac.in',
                 'www.studentportal.vnit.ac.in',
                 '210.212.165.236',
                 '10.18.0.8']

#Email settings
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'studentportal@students.vnit.ac.in' 
EMAIL_HOST_PASSWORD = 'lengthyproject'

# Application definition
# Holds the names of all Django applications that are activated in this django instance.
PREREQUISITE_APPS= [
    'django.contrib.admin', #The admin site. 
    'django.contrib.auth', #An authentication system.
    'django.contrib.contenttypes', #A framework for content types.
    'django.contrib.sessions', #A session framework.
    'django.contrib.messages', #A messaging framework.
    'django.contrib.staticfiles', #A framework for managing static files.
    ]

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    #'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
)

ROOT_URLCONF = 'studentportal.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(BASE_DIR,'../templates'),
            os.path.join(BASE_DIR,'../clubsapp/templates'),
            os.path.join(BASE_DIR,'../portalapp/templates')
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.core.context_processors.request', #Pagination
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'studentportal.wsgi.application'

#Password hashing
PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.PBKDF2PasswordHasher',
    'django.contrib.auth.hashers.PBKDF2SHA1PasswordHasher',
    #'django.contrib.auth.hashers.Argon2PasswordHasher',
    'django.contrib.auth.hashers.BCryptSHA256PasswordHasher',
    'django.contrib.auth.hashers.BCryptPasswordHasher',
]

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases
''' Work with this db while working with amazon host'''
#  'HOST': 'studentportal.ces0h2i088mi.us-west-2.rds.amazonaws.com',

# The databases are defined in other settings file


# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

STATIC_URL = '/static/'
''' STATIC_ROOT is the folder where every static files will be stored after a manage.py collectstatic '''
STATIC_ROOT = 'static'
''' STATICFILES_DIRS is the list of folder where Django will search for additional static files, in addition to each static folder of each app installed. '''
''' Since we have only the root static folder of the 'portalapp' we can comment the below '''
STATICFILES_DIRS = [
    "/home/studentportal/studentportal/portalapp/static",
    "/home/studentportal/studentportal/clubsapp/static"
                ]
MEDIA_URL = '/media/'
''' MEDIA_ROOT is the folder where every uploaded files will be stored after a manage.py collectstatic '''
MEDIA_ROOT = os.path.join(BASE_DIR, '../media')
