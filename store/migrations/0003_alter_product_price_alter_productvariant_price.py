# Generated by Django 4.1.3 on 2023-01-09 07:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0002_alter_category_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='price',
            field=models.DecimalField(decimal_places=2, default=12.22, max_digits=6),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='productvariant',
            name='price',
            field=models.DecimalField(decimal_places=2, max_digits=6),
        ),
    ]