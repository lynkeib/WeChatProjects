from django.db import models
from apis.models import App


# Create your models here.
class User(models.Model):
    open_id = models.CharField(max_length=32, unique=True)
    nickname = models.CharField(max_length=256)
    focus_cities = models.TextField(default='[]')
    focus_constellations = models.TextField(default='[]')
    focus_stocks = models.TextField(default='[]')

    menu = models.ManyToManyField(App)

    class Meta:
        indexes = [
            # models.Index(fields=['nickname']),
            models.Index(fields=['open_id', 'nickname'])
        ]

    def __str__(self):
        return f"{self.nickname}"
