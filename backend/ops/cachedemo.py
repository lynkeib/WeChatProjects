import os
import django
import time

from django.core.cache import cache

os.environ.setdefault("DJANGO_SETTINGS_MODULE", 'backend.settings')
django.setup()


def basic_use():
    s = 'Hello World, Hello Django Cache'
    cache.set('key', s)
    cache_result = cache.get('key')
    print(cache_result)
    s2 = 'Hello World, Hello Django Timeout Cache'
    cache.set('key2', s2, 5)
    cache_result = cache.get('key2')
    time.sleep(5)


if __name__ == '__main__':
    basic_use()
