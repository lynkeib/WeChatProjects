from django.contrib import admin
from .models import App


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


# admin.site.register(App, AppAdmin)
# admin.site.register(App)
