# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('portalapp', '0009_auto_20180216_0941'),
    ]

    operations = [
        migrations.AlterField(
            model_name='company_table',
            name='recentdate',
            field=models.DateField(default=datetime.date(2018, 2, 20)),
        ),
        migrations.AlterField(
            model_name='experience_internship',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 19, 16, 36, 496016)),
        ),
        migrations.AlterField(
            model_name='experience_placement',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 19, 16, 36, 494776)),
        ),
        migrations.AlterField(
            model_name='forgotpasskeys',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 19, 16, 36, 497504)),
        ),
        migrations.AlterField(
            model_name='personinformation',
            name='createdondate',
            field=models.DateField(default=datetime.date(2018, 2, 20)),
        ),
    ]
