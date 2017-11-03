
csv_filepathname="/home/studentportal/studentportal/guptagautam.csv"
django_project_home = "/home/studentportal/studentportal/"

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
from portalapp.models import Personinformation,Roles,ForLogin,Department
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
	try:
		p = Personinformation.objects.get(clg_id=int(row[3]))
		email = p.email
		#link=request.META['HTTP_HOST']+"/home"
		link="studentportal.vnit.ac.in"
		html_msg = loader.render_to_string('welcome_already_registered_users.html',		 {'name':p.firstname,'link':link}) #password_reset_email.html
		#'welcome_email.html'
		#'contribute_success_email.html'
		send_mail('Hello and Welcome to Student Portal ',"Welcome", FROM_EMAIL, [email],html_message=html_msg)
		print "already registered"
		print p.email,p.firstname,p.lastname

	except Personinformation.DoesNotExist:
		p=Personinformation()
		p.roleid=r
		#p.deptid=2 #ECE
	
		p.email=row[1]
		p.firstname=(row[2].split())[0]
		p.lastname=(row[2].split())[-1]
		p.clg_id=row[3]
		p.roll_no=row[4]
		p.telephone1=row[5]
		p.roll_no = p.roll_no.strip()
		dept_name = str(p.roll_no[4:7])
		print p.email,p.firstname,p.lastname,dept_name
		dept = Department.objects.get(short_name=dept_name)
		p.deptid = int(dept.pk)

		password = id_generator() 
	
		# print p.email,p.firstname,p.lastname
		#p.createdondate=
		
#send email 
	
		email = p.email
		#link=request.META['HTTP_HOST']+"/home"
		link="studentportal.vnit.ac.in"
		html_msg = loader.render_to_string('welcome_email.html',{'name':p.firstname,'link':link,'username':p.clg_id,'password':password }) #password_reset_email.html
		#'welcome_email.html'
		#'contribute_success_email.html'
		send_mail('Hello and Welcome to Student Portal ',"Welcome", FROM_EMAIL, [email],html_message=html_msg)

		p.save()

		l=ForLogin()
		l.clg_id=p
		#Currently storing password with encryption : 

		l.password=make_password(password )
		l.save()
        

