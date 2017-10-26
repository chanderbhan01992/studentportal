from base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

''' Work with this db while working on local'''
DATABASES = {
    'default': {
       'ENGINE': 'django.db.backends.mysql',
        'NAME': 'portal_storage', #Make it testing later
        'USER' : 'studentportal',
        'PASSWORD' : 'studentportal123',
        'HOST' : 'localhost',
        'PORT' : '3306',
    }
}