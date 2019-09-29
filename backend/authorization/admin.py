from django.contrib import admin
from .models import User


# Register your models here.
@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    exclude = ['open_id']
    # list_display = ['open_id', 'nickname', 'focus_cities', 'focus_constellations', 'focus_stocks']


# admin.site.register(User, UserAdmin)
# admin.site.register(User)
