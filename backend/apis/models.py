from django.db import models


# Create your models here.
class App(models.Model):
    appid = models.CharField(primary_key=True, max_length=32)  # unique ID
    category = models.CharField(max_length=128)  # category
    application = models.CharField(max_length=128)  # function name
    name = models.CharField(max_length=128)  # app name
    publish_date = models.DateField()  # public time
    url = models.CharField(max_length=128)  # request url
    desc = models.TextField()  # description

    def to_dict(self):
        return {
            'appid': self.appid,
            'category': self.category,
            'application': self.application,
            'name': self.name,
            'publish_date': self.publish_date,
            'url': self.url,
            'desc': self.desc
        }

    def __str__(self):
        return str(self.to_dict())

    def __repr__(self):
        return str(self.to_dict())
