from django.urls import path
from .views import weather, menu, image, service

urlpatterns = [
    # path('', weather.helloworld)
    # path('', weather.weather)
    path('weather', weather.WeatherView.as_view()),
    path('menu', menu.get_menu),
    path('image', image.ImageView.as_view()),
    path('imagetext', image.image_text),
    path('image/list', image.ImageListVIew.as_view()),
    path('stock', service.stock),
    path('constellation', service.constellation),
    path('joke', service.joke)
]
