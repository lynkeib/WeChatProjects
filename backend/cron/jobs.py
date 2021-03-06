import logging
import time
import datetime
import os
from backend import settings
from collections import defaultdict
from email.mime.text import MIMEText
import smtplib

logger = logging.getLogger('django')


def demo():
    message = f"Job log in crontab, now time is: {datetime.datetime.now()}"
    print(message)
    logger.info(message)
    pass


# Job that analyzes the log
def statistics():
    # read in statistics log content
    data_file = os.path.join(settings.BASE_DIR, 'log', 'statistics.log')
    if not os.path.exists(data_file):
        logger.warning(f'file not exists. file=[{data_file}]')
        return
    result = defaultdict(list)
    with open(data_file, 'r') as data_file:
        for line in data_file:
            line = line.strip()
            content = line.split(' ')[2]
            content_list = content.split(settings.STATISTICS_SPLIT_FLAG)
            print(content_list)
            print(content_list[0].split('=')[1][1:-1])
            log_time = int(float(content_list[0].split('=')[1][1:-1]))  # [1:-1] means remove the "[]"
            path = content_list[1].split('=')[1][1:-1]
            full_path = content_list[2].split('=')[1][1:-1]
            cost = float(content_list[3].split('=')[1][1:-1])

            # record data
            # path: value_list
            result[path].append(cost)

    # MAX, MIN, MEAN
    report_content = []
    for key, value in result.items():
        # request count
        count = len(value)
        # max
        v_max = max(value)
        # min
        v_min = min(value)
        # average
        v_avg = sum(value) * 1.00 / count

        content = f'{key} COUNT: {count}  MAX_TIME: {v_max}s  MIN_TIME: {v_min}s  AVG_TIME: {v_avg}s'

        report_content.append(content)

    return report_content


def report_by_email():
    logger.info('Begin statistics data.')
    content = statistics()
    print(content)
    content = '\r\n'.join(content)
    logger.info("End statistics data.")
    receivers = ['bconliu@gmail.com']
    msg = MIMEText(content, 'plain', 'utf-8')
    msg['FROM'] = '[Django Backend]'
    msg['Subject'] = '[Django Services Performance Monitor]'

    server = smtplib.SMTP_SSL(settings.EMAIL_HOST, settings.EMAIL_PORT)
    # server.starttls() # if use port 587 and STMP, then have to have this line
    server.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
    server.sendmail(settings.EMAIL_FROM, receivers, msg.as_string())
    server.close()
    logger.info("Send Monitor Email Success.")


if __name__ == '__main__':
    report_by_email()
