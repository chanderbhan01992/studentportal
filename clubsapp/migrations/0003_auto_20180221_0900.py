# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('portalapp', '0063_auto_20180221_0900'),
        ('clubsapp', '0002_auto_20180221_0858'),
    ]

    operations = [
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('title', models.TextField(null=True)),
                ('description', models.TextField(max_length=5000)),
                ('date', models.DateField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ActivityPhotoRelationship',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('activity', models.ForeignKey(to='clubsapp.Activity')),
            ],
        ),
        migrations.CreateModel(
            name='Club',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('shortName', models.TextField(max_length=45, null=True)),
                ('longName', models.TextField(max_length=45, null=True)),
                ('displayName', models.TextField(max_length=45, null=True)),
                ('aboutUs', models.TextField(max_length=2500, null=True)),
                ('yearOfStart', models.TextField(max_length=4, null=True)),
                ('clubHead', models.TextField()),
                ('clubType', models.TextField(max_length=45, null=True)),
                ('facultyInCharge1', models.TextField(max_length=50)),
                ('facultyInCharge2', models.TextField(max_length=50, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ClubActivityRelationship',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('activity', models.ForeignKey(to='clubsapp.Activity')),
                ('club', models.ForeignKey(to='clubsapp.Club')),
            ],
        ),
        migrations.CreateModel(
            name='ClubEventRelationship',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('club', models.ForeignKey(to='clubsapp.Club')),
            ],
        ),
        migrations.CreateModel(
            name='ClubMember',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('photograph', models.ImageField(upload_to=b'')),
                ('dateOfJoin', models.DateField(null=True)),
                ('dateOfLeave', models.DateField(null=True)),
                ('basicDetails', models.ForeignKey(to='portalapp.Personinformation')),
            ],
        ),
        migrations.CreateModel(
            name='ClubPhotoRelationship',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('club', models.ForeignKey(to='clubsapp.Club')),
            ],
        ),
        migrations.CreateModel(
            name='ContactDetails',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('email', models.EmailField(max_length=50)),
                ('website', models.URLField(null=True)),
                ('telephone1', models.CharField(max_length=15, null=True)),
                ('telephone2', models.CharField(max_length=15, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('heading', models.TextField(max_length=100, null=True)),
                ('description', models.TextField(max_length=5000, null=True)),
                ('place', models.TextField(max_length=200, null=True)),
                ('time', models.TimeField(null=True)),
                ('date', models.DateField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Faculty',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.TextField(max_length=50, null=True)),
                ('link', models.TextField(max_length=1500, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Photos',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('photograph', models.FileField(null=True, upload_to=b'', blank=True)),
                ('details', models.TextField(max_length=100, null=True)),
                ('dateOfCapture', models.DateField(null=True)),
            ],
        ),
        migrations.AddField(
            model_name='clubphotorelationship',
            name='photo',
            field=models.ForeignKey(to='clubsapp.Photos'),
        ),
        migrations.AddField(
            model_name='clubeventrelationship',
            name='event',
            field=models.ForeignKey(to='clubsapp.Event'),
        ),
        migrations.AddField(
            model_name='club',
            name='contact',
            field=models.ForeignKey(to='clubsapp.ContactDetails'),
        ),
        migrations.AddField(
            model_name='activityphotorelationship',
            name='photo',
            field=models.ForeignKey(to='clubsapp.Photos'),
        ),
    ]
