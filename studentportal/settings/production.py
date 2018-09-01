from base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

''' Work with this db while working on server'''
DATABASES = {
    'default': {
       'ENGINE': 'django.db.backends.mysql',
        'NAME': 'portal_storage',
        'USER' : 'studentportal',
        'PASSWORD' : 'studentportal123',
        'HOST' : 'localhost',
        'PORT' : '3306',
    }
}

PROJECT_APPS=[
    'portalapp',
    'clubsapp',
]

INSTALLED_APPS = PREREQUISITE_APPS + PROJECT_APPS
