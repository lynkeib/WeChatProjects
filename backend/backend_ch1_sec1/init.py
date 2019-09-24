import os
import json
import yaml
import django
import hashlib
import logging

from backend_ch1_sec1 import settings

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend_ch1_sec1.settings')
django.setup()

from apis.models import App

def init_app_data():
    old_apps = App.objects.all()
    path = os.path.join(settings.BASE_DIR, 'app.yaml')
    with open(path, 'r', encoding='utf-8') as f:
        apps = yaml.load(f)
        published = apps.get('published')
        for item in published:
            item = item.get('app')
            # generate unique id
            src = item.get('category') + item.get('application')
            appid = hashlib.md5(src.encode('utf8')).hexdigest()
            # if this id exits, the update it, else create a new one
            if len(old_apps.filter(appid=appid)) == 1:
                print('already exist, appid:', appid)
                app = old_apps.filter(appid=appid)[0]
            else:
                app = App()
                print('not exist, appid:', appid)
            app.appid = appid
            app.name = item.get('name')
            app.application = item.get('application')
            app.url = item.get('url')
            app.publish_date = item.get('publish_date')
            app.category = item.get('category')
            app.desc = item.get('desc')
            app.save()


if __name__ == '__main__':
    init_app_data()