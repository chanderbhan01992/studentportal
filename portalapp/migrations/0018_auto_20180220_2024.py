# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('portalapp', '0017_auto_20180220_2023'),
    ]

    operations = [
        migrations.AlterField(
            model_name='experience_internship',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 20, 24, 10, 859303)),
        ),
        migrations.AlterField(
            model_name='experience_placement',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 20, 24, 10, 858072)),
        ),
        migrations.AlterField(
            model_name='forgotpasskeys',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2018, 2, 20, 20, 24, 10, 860796)),
        ),
    ]
