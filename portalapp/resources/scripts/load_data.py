# coding: utf-8
import sys,os
import csv
from datetime import datetime
from django.http import HttpResponseRedirect
import requests
import urllib2
import json
import datetime
import random, string
from django.template import loader # Sending html page as email
import dateutil.parser
from django.core.files import File
from django.core.files.temp import NamedTemporaryFile


''' SETUP DJANGO ENVIRONMENT '''
BASE_DIR = os.path.dirname(
                        os.path.dirname(
                            os.path.abspath(__file__)
                        )
                    )

DJANGO_PROJECT_HOME = os.path.dirname(
                os.path.dirname(
                    BASE_DIR
                )
            )
sys.path.append(DJANGO_PROJECT_HOME)

os.environ['DJANGO_SETTINGS_MODULE'] = 'studentportal.settings.development'

'''Importing Models'''
print "Importing models ..."
from portalapp.models import *
from django.contrib.auth.models import *
print "Importing Done"


''' FILES AND DIRECTORIES '''
DIRECTORY_CSVFILES = "/CSVFiles"
FILE_CSV_COMPANY = BASE_DIR + DIRECTORY_CSVFILES + "/Club.csv"
FILE_CSV_PERSONALINFORMATION = BASE_DIR + DIRECTORY_CSVFILES + "/ContactDetails.csv"


'''  ----------- '''
FROM_EMAIL = 'studentportal@students.vnit.ac.in'
LINK = "studentportal.vnit.ac.in"
WELCOME_TEXT = "'Hello and Welcome to Student Portal '"


''' generate random string'''
def randomword(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

'''Load Data Into PersonalInformation'''
def loadPersonalInformation():
    dataReader = csv.reader(open(FILE_CSV_PERSONALINFORMATION), delimiter=',', quotechar='"')
    r = Roles.objects.filter(short_name="Student").first()
    for row in dataReader:
        if row[0] == 'Timestamp':  # Ignore the header row, import everything
            print 'Ignored the header'
        else:
            try:
                p = Personinformation.objects.get(clg_id=int(row[3]))
                email = p.email
                html_msg = loader.render_to_string('welcome_already_registered_users.html',
                                                   {'name': p.firstname, 'link': LINK})  # password_reset_email.html
                send_mail(WELCOME_TEXT, "Welcome", FROM_EMAIL, [email], html_message=html_msg)
                print "Already Registered"
                print "Email: " + p.email
                print "Name: " + p.firstname + ' ' +p .lastname

            except Personinformation.DoesNotExist:
                p = Personinformation()
                p.roleid = r
                # p.deptid=2 #ECE

                p.email = row[1]
                p.firstname = (row[2].split())[0]
                p.lastname = (row[2].split())[-1]
                p.clg_id = row[3]
                p.roll_no = row[4]
                p.telephone1 = row[5]
                p.roll_no = p.roll_no.strip()
                dept_name = str(p.roll_no[4:7])
                print p.email, p.firstname, p.lastname, dept_name
                dept = Department.objects.get(short_name=dept_name)
                p.deptid = int(dept.pk)

                password = "SP_" + randomword(6) + "_2018"

                # send email

                email = p.email
                html_msg = loader.render_to_string('welcome_email.html',
                                                   {'name': p.firstname, 'link': LINK, 'username': p.clg_id,
                                                    'password': password})  # password_reset_email.html
                # 'welcome_email.html'
                # 'contribute_success_email.html'
                send_mail(WELCOME_TEXT, "Welcome", FROM_EMAIL, [email], html_message=html_msg)

                p.save()

                l = ForLogin()
                l.clg_id = p
                # Currently storing password with encryption :
                l.password = password
                l.save()
                print "Registered"
                print "Email: " + row[1]
                print "Name: " + row[2]



'''Loads Company'''
def loadCompany():
    dataReader = csv.reader(open(FILE_CSV_COMPANY), delimiter=',', quotechar='"')
    for row in dataReader:
        if row[0] == 'id': # Ignore the header row, import everything
            print 'Ignored the header'
        else :
            c = company_table()
            c.company_name = row[1]
            print(c.company_name)
            c.short_name = row[2]
            c.long_name = row[3]
            c.display_name = row[4]
            c.intern_exp_count = int(row[5])
            c.job_exp_count = int(row[6])
            c.company_intern_valid = int(row[7])
            c.company_job_valid = int(row[8])
            c.startdate = row[9]
            c.valid = int(row[11])
            c.save()
            print "Stored"+row[1]

if __name__ == '__main__':
    #Run whichever method you want to run
    #loadPersonalInformation ()
    print "IT WAS A TEST"
