import json
import requests
# from utils import proxy
import backend_ch1_sec1.settings

from authorization.models import User

# from utils.wx.crypt import WXBizDataCrypt
from utils.wx.code2session import code2session


# determine whether this user is authroized or not
def already_authorized(request):
    is_authorized = False

    if request.session.get('is_authorized'):
        is_authorized = True
    return is_authorized


def get_user(request):
    if not already_authorized(request):
        raise Exception('not authorized request')
    open_id = request.session.get('open_id')
    user = User.objects.get(open_id=open_id)
    return user


def c2s(appid, code):
    return code2session(appid, code)

'''
return data 
{
  "session_key": "JmRNs6uPEpFzlMRmg4NqJQ==",
  "expires_in": 7200,
  "openid": "oXSML0ZH05BItFTFILfgCGxXxxik"
}
'''
def code2session(appid, code):
    API = 'https://api.weixin.qq.com/sns/jscode2session'
    params = 'appid=%s&secret=%s&js_code=%s&grant_type=authorization_code' % \
             (appid, backend_ch1_sec1.settings.WX_APP_SECRET, code)
    url = API + '?' + params
    response = requests.get(url=url)
    data = json.loads(response.text)
    print(data)
    return data
