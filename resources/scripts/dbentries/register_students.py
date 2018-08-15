
csv_filepathname="/home/portal/studentportal/studentportal/LoadCSVs/ECE17_Personal_data_Update2.csv"
django_project_home = "/home/portal/studentportal/studentportal/"

import sys,os

''' Password generator '''
import string
import random

def id_generator(size=8, chars=string.ascii_uppercase + string.digits):
	return ''.join(random.choice(chars) for _ in range(size))

'''  ----------- '''
FROM_EMAIL = 'studentportal@students.vnit.ac.in'

sys.path.append(django_project_home)
os.environ['DJANGO_SETTINGS_MODULE'] = 'studentportal.settings'
print "bfr import models"
from portalapp.models import Personinformation,Roles,ForLogin
from django.core.mail import send_mail
from django.contrib.auth.models import *
from django.template import loader # Sending html page as email
from django.contrib.auth.hashers import *

print "aftr" 
import csv
dataReader = csv.reader(open(csv_filepathname), delimiter=',', quotechar='"')

r=Roles.objects.filter(short_name="Student").first()
for row in dataReader:
    if row[0] == 'Timestamp': # Ignore the header row, import everything 
        print 'Ignored the header'    
    else :
	#if row[4]=="15649" or row[4]=="15617" or row[4]=="15695" or row[4]=="15613":
	
	p=Personinformation()
	p.roleid=r
	p.deptid=2 #ECE
	
	p.email=row[1]
	p.firstname=row[2]
	p.lastname=row[3]
	p.clg_id=row[4]
	p.roll_no=row[5]
	p.telephone1=row[6]
	
	print p.email,p.firstname,p.lastname
	#p.createdondate=
	p.save()

	l=ForLogin()
	l.clg_id=p
	#Currently storing password with encryption : 
	password = id_generator() 
	l.password=make_password(password )
	l.save()
#send email 

	email = p.email
	#link=request.META['HTTP_HOST']+"/home"
	link="10.18.0.8:8000"+"/home"
	html_msg = loader.render_to_string('welcome_email.html', {'name':p.firstname, 'link':link, 'username':p.clg_id, 'password':password}) #password_reset_email.html
	#'welcome_email.html'
	#'contribute_success_email.html'
	send_mail('Hello and Welcome to Student Portal ',"Welcome", FROM_EMAIL, [email],html_message=html_msg)
               

