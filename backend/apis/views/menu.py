from backend import settings
import yaml
import os
import utils.response
from django.http import JsonResponse

import json
from django.views import View

from backend import settings
from authorization.models import User
from apis.models import App

import utils.response
from utils.auth import already_authorized, get_user
from utils.response import CommonResponseMixin, ReturnCode


def init_app_data():
    data_file = os.path.join(settings.BASE_DIR, 'app.yaml')
    with open(data_file, 'r', encoding='utf-8') as f:
        apps = yaml.load(f)
        # print(apps)
        return apps


def get_menu(request):
    global_app_data = init_app_data()
    published_app_data = global_app_data.get('published')
    response = utils.response.CommonResponseMixin.wrap_json_response(data=published_app_data,
                                                                     code=utils.response.ReturnCode.SUCCESS)
    print(response)
    return JsonResponse(data=response, safe=False)

class UserMenu(View, CommonResponseMixin):
    def get(self, request):
        # 如果没登录，返回未鉴权
        if not already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.UNAUTHORIZED)
            return JsonResponse(response, safe=False)
        # 否则返回用户定制的menu
        open_id = request.session.get('open_id')
        user = User.objects.get(open_id=open_id)
        menu_list = user.menu.all()

        user_menu = []
        for app in menu_list:
            user_menu.append(app.to_dict())
        response = self.wrap_json_response(data=user_menu, code=ReturnCode.SUCCESS)
        return JsonResponse(response, safe=False)

    def post(self, request):
        # 如果没登录，返回未鉴权
        if not already_authorized(request):
            response = self.wrap_json_response(code=ReturnCode.UNAUTHORIZED)
            return JsonResponse(response, safe=False)
        user = get_user(request)
        post_menu = json.loads(request.body.decode('utf-8'))
        post_menu = post_menu.get('data')
        focus_menu = []
        print(post_menu)
        for item in post_menu:
            print(item)
            print(item.get('appid'))
            item = App.objects.get(appid=item.get('appid'))
            print(item)
            focus_menu.append(item)
        print(focus_menu)
        user.menu.set(focus_menu)
        user.save()
        response = CommonResponseMixin.wrap_json_response(code=ReturnCode.SUCCESS)
        return JsonResponse(response, safe=False)
