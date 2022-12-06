# Generated by Django 4.1.3 on 2022-12-06 04:23

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0004_remove_pizza_seller'),
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('price', models.IntegerField()),
                ('desc', models.TextField(max_length=500)),
                ('image', models.ImageField(blank=True, upload_to='images')),
                ('created_at', models.DateField(auto_now_add=True)),
                ('updated_at', models.DateField(auto_now=True)),
                ('product_type', models.CharField(choices=[('Pizza', 'pizza'), ('Nonpizza', 'nonpizza')], max_length=10)),
            ],
        ),
        migrations.DeleteModel(
            name='Pizza',
        ),
    ]
