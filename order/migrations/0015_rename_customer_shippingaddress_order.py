# Generated by Django 4.1.3 on 2022-12-23 06:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0014_alter_shippingaddress_address_2_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='shippingaddress',
            old_name='customer',
            new_name='order',
        ),
    ]
