# Generated by Django 4.1.3 on 2023-01-04 09:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0004_pickupdetails_email_pickupdetails_phone'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='PickUpDetails',
            new_name='PickUpDetail',
        ),
    ]