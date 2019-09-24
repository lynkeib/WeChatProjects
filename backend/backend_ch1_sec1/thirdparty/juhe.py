import json
import requests
import time


def weather(cityname):
    '''
    :param cityname: city name
    :return: return weather
    '''
    key = '13d36defa81488f1a438adbeb94622f1'
    api = 'http://v.juhe.cn/weather/index'
    # key = '70c9a4425bc67bbe16ba982b8b76dc78'
    # api = 'http://apis.juhe.cn/simpleWeather/query'
    params = 'cityname=%s&key=%s' % (cityname, key)
    url = api + '?' + params
    print(url)
    response = requests.get(url=url)
    data = json.loads(response.text)
    print(data)
    result = data.get('result')
    print('from weather.py', result)
    sk = result.get('sk')
    response = {}
    response['temperature'] = sk.get('temp')
    response['wind_direction'] = sk.get('wind_direction')
    response['wind_strength'] = sk.get('wind_strength')
    response['humidity'] = sk.get('humidity')
    response['time'] = sk.get('time')
    print('from weather.py, response, ', response)
    return response


def stock(market, code):
    api = 'http://web.juhe.cn:8080/finance/stock/hs'
    key = '42e99815b75038fd8725a03336b4c2f5'
    params = "gid=%s%s&key=%s" % (market, code, key)
    url = api + '?' + params
    print(url)
    response = requests.get(url=url)
    # print(response.text)
    data = json.loads(response.text)
    data = data.get('result')[0].get('data')
    response = {'name': data.get('name'),
                'now_price': data.get('nowPri'),
                'today_min': data.get('todayMin'),
                'today_max': data.get('todayMax'),
                'start_price': data.get('todayStartPri'),
                'date': data.get('date'),
                'time': data.get('time')
                }
    response['is_rising'] = data.get('nowPri') > data.get('todayStartPri')
    sub = abs(float(data.get('nowPri')) - float(data.get('todayStartPri')))
    response['sub'] = float('%.3f' % sub)
    return response


def constellation(cons_name):
    '''
    :param cons_name: constellation name
    :return: json today's info
    '''
    key = 'e277e746594b9fb0d3657ef3b39cb2a7'
    api = 'http://web.juhe.cn:8080/constellation/getAll'
    types = ('today', 'tomorrow', 'week', 'month', 'year')
    params = 'consName=%s&type=%s&key=%s' % (cons_name, types[0], key)
    url = api + '?' + params
    print(url)
    response = requests.get(url=url)
    data = json.loads(response.text)
    return {
        'name': cons_name,
        'text': data['summary']
    }


def joke(page, number):
    '''

    '''
    key = 'a71b17ddf82dc751478cd6bc5a03b617'
    api = 'http://v.juhe.cn/joke/content/list.php'
    # types = ('today', 'tomorrow', 'week', 'month', 'year')
    # now = datetime.timestamp(datetime.now())

    params = 'key=%s&page=%s&pagesize=%s&sort=desc&time=%s' % (key, page, number, int(time.time()))
    url = api + '?' + params
    print(url)
    response = requests.get(url=url)
    data = json.loads(response.text)
    print(data)
    return data['result']
