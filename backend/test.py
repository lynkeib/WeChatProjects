import sys
# up_day_limit = 1
# curr_day = 0
# up_count = 0
# price = 1
# while 1:
#     day = input()
#     if not day:
#         break
#     if day == "1":
#         # print('thiprice += 1
#         sys.stdout.write(str(price))
#         price += 1
#         up_count += 1
#     else:
#         if up_count < up_day_limit:
#             sys.stdout.write(str(price))
#             price += 1
#             up_count += 1
#         else : #up_count == up_day_limit
#
#             sys.stdout.write(str(price))
#             # price += 1
#             up_count = 0
#             up_day_limit += 1
#             price -= 1


# day = int(input())
#
# curr_day = 1
# price = 0
# res = 0
# up_limit = 0
# up_count = 0
#
# while curr_day <= day:
#     if up_count <= up_limit:
#         up_count += 1
#         price += 1
#         res = price
#         curr_day += 1
#     else: # up_count == up_limit
#         up_limit += 1
#         up_count = 0
#         price -= 1
#         res = price
#         curr_day += 1
#
# sys.stdout.write(str(res))

import time
import random
import requests
import datetime


def test():
    while True:
        time.sleep(1)
        tick = time.time()
        requests.get('http://127.0.0.1:8000/api/v1.0/service/test')
        requests.get('http://127.0.0.1:8000/api/v1.0/service/image/list')
        tock = time.time()
        print('send request at %s, request cost: %.4f' % (str(datetime.datetime.now()), tock - tick))


if __name__ == '__main__':
    test()
