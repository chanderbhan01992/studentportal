from base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

''' Work with this db while working on local'''
DATABASES = {
    'default': {
       'ENGINE': 'django.db.backends.mysql',
        'NAME': 'portal_storage', #Make it testing later
        'USER' : 'root',
        'PASSWORD' : 'studentportal123',
        'HOST' : 'localhost',
        'PORT' : '3306',
    }
}

PROJECT_APPS=[
    'portalapp',
]

INSTALLED_APPS = PREREQUISITE_APPS + PROJECT_APPS

