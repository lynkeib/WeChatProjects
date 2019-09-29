from django.contrib import admin
from .models import App
import hashlib

# Register your models here.
# class AppAdmin(admin.ModelAdmin):
#     list_display = ['appid',
#                     'category',
#                     'application',
#                     'name',
#                     'publish_date',
#                     'url',
#                     'desc']

@admin.register(App)
class AppAdmin(admin.ModelAdmin):
    fields = ['name', 'application', 'category', 'url', 'publish_date', 'desc']

    def save_model(self, request, obj, form, change):
        src = obj.category + obj.application
        appid = hashlib.md5(src.encode('utf8')).hexdigest()
        obj.appid = appid
        super().save_model(request, obj, form, change)

# admin.site.register(App, AppAdmin)
# admin.site.register(App)
