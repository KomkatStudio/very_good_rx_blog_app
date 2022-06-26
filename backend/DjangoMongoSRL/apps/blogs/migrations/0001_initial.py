
# Generated by Django 3.0.5 on 2022-06-21 10:00

from django.db import migrations, models
import djongo.models.fields



class Migration(migrations.Migration):

    initial = True

    dependencies = [


    operations = [
        migrations.CreateModel(
            name='Blog',
            fields=[
                ('_id', djongo.models.fields.ObjectIdField(auto_created=True, primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=400)),
                ('author_id', models.CharField(max_length=24)),
                ('likes', models.IntegerField(default=0)),
                ('category', djongo.models.fields.JSONField(default=[])),
                ('image_url', models.CharField(default='', max_length=50000)),
                ('content', models.CharField(max_length=5000000000)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]
