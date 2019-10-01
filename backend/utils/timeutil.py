import time
import datetime


def get_day_left_in_second():
    """
    return how many seconds left in one day（unit：s）
    :return:
    """
    now = datetime.datetime.now()
    tomorrow = now + datetime.timedelta(days=1)
    left = (datetime.datetime(tomorrow.year,
                              tomorrow.month, tomorrow.day, 0, 0, 0) - now)
    return int(left.total_seconds())


if __name__ == '__main__':
    print(get_day_left_in_second())
