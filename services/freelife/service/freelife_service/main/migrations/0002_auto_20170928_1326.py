# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-09-28 13:26
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='info',
            old_name='cnn',
            new_name='ccn',
        ),
    ]
