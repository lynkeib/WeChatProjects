#!/usr/bin/python
# -*-encoding=utf8 -*-

import datetime


class CommonWeatherResult:
    def __init__(self):
        # temperature
        self.temperature = None
        # wind direction
        self.wind_direction = None
        # wind strength
        self.wind_strength = None
        # humidity
        self.humidity = None
        self.time = None

    def __str__(self):
        '''
        温度: 22
        风向: 东南风
        风强度: 2级
        湿度: 45%
        '''
        s = []
        s.append('温度: %s' % self.temperature)
        s.append('风向: %s' % self.wind_direction)
        s.append('风强度: %s' % self.wind_strength)
        s.append('湿度: %s' % self.humidity)
        s = '\r\n'.join(s)
        s += ('\r\n')
        return s

    def __repr__(self):
        '''
                温度: 22
                风向: 东南风
                风强度: 2级
                湿度: 45%
                '''
        s = []
        s.append('温度: %s' % self.temperature)
        s.append('风向: %s' % self.wind_direction)
        s.append('风强度: %s' % self.wind_strength)
        s.append('湿度: %s' % self.humidity)
        s = '\r\n'.join(s)
        s += ('\r\n')
        return s

    def to_dict(self):
        result = {}
        result['temperature'] = self.temperature
        result['wind_direction'] = self.wind_direction
        result['wind_strength'] = self.wind_strength
        result['humidity'] = self.humidity
        result['time'] = self.time if self.time else datetime.datetime.now()
        return result
