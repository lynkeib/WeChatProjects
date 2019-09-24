from django.shortcuts import render
from django.http import JsonResponse
from utils.response import CommonResponseMixin, ReturnCode
from django.views import View
import json
from utils.auth import c2s, already_authorized
from .models import User


# Create your views here.

def test_session(request):
    request.session['message'] = 'Test Django Session Ok'
    response = CommonResponseMixin.wrap_json_response(code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def test_session2(request):
    print('session is', request.session.items())
    response = CommonResponseMixin.wrap_json_response(code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


class UserView(View, CommonResponseMixin):
    def get(self, request):
        # print(request.session.get('open_id'))
        if not already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.SUCCESS)
            return JsonResponse(data=response, safe=False)
        open_id = request.session.get('open_id')
        user = User.objects.get(open_id=open_id)
        data = {}
        data['focus'] = {}
        data['focus']['city'] = json.loads(user.focus_cities)
        data['focus']['constellation'] = json.loads(user.focus_constellations)
        data['focus']['stock'] = json.loads(user.focus_stocks)
        response = self.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
        print(response)
        return JsonResponse(data=response, safe=False)

    def post(self, request):
        if not already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.SUCCESS)
            return JsonResponse(data=response, safe=False)
        print(request.session.get('open_id'))
        open_id = request.session.get('open_id')
        user = User.objects.get(open_id=open_id)

        received_body = request.body.decode('utf-8')
        received_body = eval(received_body)
        cities = received_body.get('city')
        stocks = received_body.get('stock')
        constellations = received_body.get('constellation')
        user.focus_cities = json.dumps(cities)
        user.focus_constellations = json.dumps(constellations)
        user.focus_stocks = json.dumps(stocks)
        print(user)
        user.save()
        response = self.wrap_json_response(message='modify user info success')
        return JsonResponse(data=response, safe=False)


def __authorize_by_code(request):
    response = {}
    post_data = request.body.decode('utf-8')
    post_data = json.loads(post_data)
    app_id = post_data.get('appId').strip()
    nickname = post_data.get('nickname').strip()
    code = post_data.get('code').strip()
    print(code)
    print(app_id)
    if not (app_id and code):
        response['result_code'] = ReturnCode.BROKEN_AUTHORIZED_DATA
        response['message'] = 'authorized failed. need entire authorization data.'
        return JsonResponse(response, safe=False)
    try:
        data = c2s(app_id, code)
    except Exception as e:
        print(e)
        response['result_code'] = ReturnCode.FAILED
        response['message'] = 'authorized failed.'
        return JsonResponse(response, safe=False)
    open_id = data.get('openid')
    if not open_id:
        response['result_code'] = ReturnCode.FAILED
        response['message'] = 'authorization error.'
        return JsonResponse(response, safe=False)
    request.session['open_id'] = open_id
    request.session['is_authorized'] = True

    print(open_id)
    # User.objects.get(open_id=open_id) # do not use get，if the result !=1 the program will throw errors
    # if the user doesn't exit, then create a new one
    if not User.objects.filter(open_id=open_id):
        new_user = User(open_id=open_id, nickname=nickname)
        new_user.save()

    message = 'user authorize successfully.'
    response = CommonResponseMixin.wrap_json_response(data={}, code=ReturnCode.SUCCESS, message=message)
    return JsonResponse(response, safe=False)


def authorize(request):
    return __authorize_by_code(request)


def logout(request):
    # print(request.session)
    # response = CommonResponseMixin.wrap_json_response(message="GG")
    # return JsonResponse(response, safe=False)
    request.session.clear()
    response = CommonResponseMixin.wrap_json_response(code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)


def get_status(request):
    print('call get_status function...')
    if already_authorized(request):
        data = {'is_authorized': 1}
    else:
        data = {'is_authorized': 0}
    response = CommonResponseMixin.wrap_json_response(data=data, code=ReturnCode.SUCCESS)
    return JsonResponse(data=response, safe=False)
