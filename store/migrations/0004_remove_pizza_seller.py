# Generated by Django 4.1.3 on 2022-12-06 04:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0003_profile'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='pizza',
            name='seller',
        ),
    ]
