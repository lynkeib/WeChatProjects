import os
import json
import random
from django.http import JsonResponse

from backend import settings
from utils.response import CommonResponseMixin, ReturnCode
import thirdparty.juhe
from utils.auth import already_authorized, get_user

constellations = ['白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座', '天秤座', '天蝎座', '射手座', '摩羯座', '水瓶座', '双鱼座']
all_constellations = ['白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座', '天秤座', '天蝎座', '射手座', '摩羯座', '水瓶座', '双鱼座']
popular_stocks = [
    {
        'code': '000001',
        'name': '平安银行',
        'market': 'sz'
    },
    {
        'code': '000002',
        'name': '万科A',
        'market': 'sz'
    },
    {
        'code': '600036',
        'name': '招商银行',
        'market': 'sh'
    },
    {
        'code': '601398',
        'name': '工商银行',
        'market': 'sh'
    }
]


def stock(request):
    data = []
    if already_authorized(request):
        user = get_user(request)
        stocks = json.loads(user.focus_stocks)
    else:
        stocks = popular_stocks
    for stock in stocks:
        result = thirdparty.juhe.stock(stock['market'], stock['code'])
        data.append(result)
    response = CommonResponseMixin.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def constellation(request):
    data = []
    if already_authorized(request):
        user = get_user(request)
        constellations = json.loads(user.focus_constellations)
    else:
        constellations = all_constellations
    for c in constellations:
        result = thirdparty.juhe.constellation(c)
        data.append(result)
    response = CommonResponseMixin.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def joke(request):
    data = thirdparty.juhe.joke(1, 20)
    response = CommonResponseMixin.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    print(response)
    return JsonResponse(data=response, safe=False)
