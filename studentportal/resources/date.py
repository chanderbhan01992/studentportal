django_project_home = "/home/portal/studentportal/studentportal/"

import sys,os

sys.path.append(django_project_home)
os.environ['DJANGO_SETTINGS_MODULE'] = 'studentportal.settings'
print "bfr import models"
from portalapp.models import company_table
from datetime import datetime, date
import pandas as pd

companies = company_table.objects.all()

for c in companies:
	if c.id < 173:
		c.startdate = c.recentdate
	else:
		c.recentdate = c.startdate
	c.save()
