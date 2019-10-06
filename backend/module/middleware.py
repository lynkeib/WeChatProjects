import time
import logging
from backend import settings

logger = logging.getLogger('statistics')


# Statistics middleware

class StatisticsMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        logger.info("Build StatisticsMiddleware.")

    def __call__(self, request):
        tick = time.time()
        response = self.get_response(request)
        path = request.path
        full_path = request.get_full_path()
        tock = time.time()
        cost = tock - tick
        content_list = []
        content_list.append(f'now=[{tock}]')
        content_list.append(f'path=[{path}]')
        content_list.append(f'full_path=[{full_path}]')
        content_list.append(f'cost=[{round(cost, 1)}]')
        content = settings.STATISTICS_SPLIT_FLAG.join(content_list)
        logger.info(content)

        return response
