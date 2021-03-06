# Generated by Django 2.0 on 2019-09-24 17:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authorization', '0005_auto_20190924_1715'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='nickname',
            field=models.CharField(max_length=256),
        ),
        migrations.AddIndex(
            model_name='user',
            index=models.Index(fields=['nickname'], name='authorizati_nicknam_b76290_idx'),
        ),
        migrations.AddIndex(
            model_name='user',
            index=models.Index(fields=['open_id', 'nickname'], name='authorizati_open_id_5cfcc1_idx'),
        ),
    ]
