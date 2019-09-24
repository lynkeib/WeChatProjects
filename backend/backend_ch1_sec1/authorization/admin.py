from django.contrib import admin
from .models import User


# Register your models here.
class UserAdmin(admin.ModelAdmin):
    list_display = ['open_id', 'nickname', 'focus_cities', 'focus_constellations', 'focus_stocks']


admin.site.register(User, UserAdmin)
