# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('portalapp', '0045_auto_20180220_2233'),
    ]

    operations = [
        migrations.AlterField(
            model_name='experience_internship',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 22, 37, 0, 555224)),
        ),
        migrations.AlterField(
            model_name='experience_placement',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 22, 37, 0, 553958)),
        ),
        migrations.AlterField(
            model_name='forgotpasskeys',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 22, 37, 0, 556669)),
        ),
    ]
