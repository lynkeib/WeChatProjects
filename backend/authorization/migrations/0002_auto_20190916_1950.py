# Generated by Django 2.0 on 2019-09-16 19:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('authorization', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='nikename',
            new_name='nickname',
        ),
    ]
