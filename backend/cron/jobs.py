import logging
import time
import datetime

logger = logging.getLogger('django')


def demo():
    message = f"Job log in crontab, now time is: {datetime.datetime.now()}"
    print(message)
    logger.info(message)
    pass
