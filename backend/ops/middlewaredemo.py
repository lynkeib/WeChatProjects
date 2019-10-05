import logging

logger = logging.getLogger('django')


class TestMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response
        logger.info("Build TestMiddleware")

    def __call__(self, request):
        logger.info("Test Middleware before request")
        response = self.get_response(request)
        logger.info("Test Middleware after request")
        return response
