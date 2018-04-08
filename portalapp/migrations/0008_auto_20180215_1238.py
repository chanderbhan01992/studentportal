# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('portalapp', '0007_auto_20170924_1308'),
    ]

    operations = [
        migrations.AlterField(
            model_name='company_table',
            name='recentdate',
            field=models.DateField(default=datetime.date(2018, 2, 15)),
        ),
        migrations.AlterField(
            model_name='experience_internship',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 15, 12, 38, 46, 45016)),
        ),
        migrations.AlterField(
            model_name='experience_placement',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 15, 12, 38, 46, 43795)),
        ),
        migrations.AlterField(
            model_name='forgotpasskeys',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 15, 12, 38, 46, 46513)),
        ),
        migrations.AlterField(
            model_name='personinformation',
            name='createdondate',
            field=models.DateField(default=datetime.date(2018, 2, 15)),
        ),
    ]
