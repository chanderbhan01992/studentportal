# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('clubsapp', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='activityphotorelationship',
            name='activity',
        ),
        migrations.RemoveField(
            model_name='activityphotorelationship',
            name='photo',
        ),
        migrations.RemoveField(
            model_name='club',
            name='contact',
        ),
        migrations.RemoveField(
            model_name='clubactivityrelationship',
            name='activity',
        ),
        migrations.RemoveField(
            model_name='clubactivityrelationship',
            name='club',
        ),
        migrations.RemoveField(
            model_name='clubeventrelationship',
            name='club',
        ),
        migrations.RemoveField(
            model_name='clubeventrelationship',
            name='event',
        ),
        migrations.RemoveField(
            model_name='clubmember',
            name='basicDetails',
        ),
        migrations.RemoveField(
            model_name='clubphotorelationship',
            name='club',
        ),
        migrations.RemoveField(
            model_name='clubphotorelationship',
            name='photo',
        ),
        migrations.DeleteModel(
            name='Faculty',
        ),
        migrations.DeleteModel(
            name='Activity',
        ),
        migrations.DeleteModel(
            name='ActivityPhotoRelationship',
        ),
        migrations.DeleteModel(
            name='Club',
        ),
        migrations.DeleteModel(
            name='ClubActivityRelationship',
        ),
        migrations.DeleteModel(
            name='ClubEventRelationship',
        ),
        migrations.DeleteModel(
            name='ClubMember',
        ),
        migrations.DeleteModel(
            name='ClubPhotoRelationship',
        ),
        migrations.DeleteModel(
            name='ContactDetails',
        ),
        migrations.DeleteModel(
            name='Event',
        ),
        migrations.DeleteModel(
            name='Photos',
        ),
    ]
