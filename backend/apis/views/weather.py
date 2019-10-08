from django.http import HttpResponse, JsonResponse, FileResponse
from thirdparty import juhe
import json
from django.views import View
from utils.response import CommonResponseMixin, ReturnCode
from utils.auth import already_authorized
from authorization.models import User
from thirdparty.weather.common import WeatherAPIProxy
from backend import settings

def helloworld(request):
    print('request method', request.method)
    print('request META:', request.META)
    print('request cookies:', request.COOKIES)
    print('request, querydict: ', request.GET)
    # return HttpResponse(content='Hello Django Response', status=201)
    m = {
        'message': "Hello Django Response"
    }
    return JsonResponse(data=m, status=200, safe=False)
    pass


# def weather(request):
#     if request.method == 'GET':
#         city = request.GET.get('city')
#         data = juhe.weather(city)
#         return JsonResponse(data=data, status=200)
#     elif request.method == "POST":
#         received_body = request.body
#         received_body = json.loads(received_body)
#         cities = received_body.get('cities')
#         response_data = []
#         for city in cities:
#             result = juhe.weather(city)
#             result['city'] = city
#             response_data.append(result)
#         return JsonResponse(data=response_data, safe=False, status=200)
#     else:
#         print('not support method.')


class WeatherView(View, CommonResponseMixin):
    def get(self, request):
        # 返回用户关心城市的天气
        if not already_authorized(request):
            response = self.wrap_json_response(data={}, code=ReturnCode.UNAUTHORIZED)
        else:
            data = []
            open_id = request.session.get('open_id')
            user = User.objects.get(open_id=open_id)
            cities = json.loads(user.focus_cities)
            for city in cities:
                # result = juhe.weather(city.get('city'))
                # result['city_info'] = city
                result = WeatherAPIProxy.ha_request(city.get('city'), timeout=settings.HA_TIMEOUT)
                result['city_info'] = city
            response = self.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
        return JsonResponse(data=response, safe=False)

    def post(self, request):
        received_body = request.body.decode('utf-8')
        print(request.body)
        received_body = json.loads(received_body)
        cities = received_body.get('cities')
        response_data = []
        for city in cities:
            result = juhe.weather(city.get('city'))
            result['city_info'] = city
            response_data.append(result)
        response_data = self.wrap_json_response(data=response_data)
        return JsonResponse(data=response_data, safe=False, status=200)
