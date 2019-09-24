from django.urls import path
# import views
from .views import *

urlpatterns = [
    path('test/', test_session),
    path('test2/', test_session2),
    path('user', UserView.as_view()),
    path('authorize', authorize, name='authorize'),
    path('logout', logout, name='logout'),
    path('status', get_status, name='get_status')
]
