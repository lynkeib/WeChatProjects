from backend import settings
import os
from django.http import Http404, HttpResponse, FileResponse, JsonResponse
from utils.response import ReturnCode
import utils
from django.views import View
import hashlib


class ImageView(View, utils.response.CommonResponseMixin):
    def get(self, request):
        md5 = request.GET.get('md5')
        imgfile = os.path.join(settings.IMAGES_DIR, md5 + '.jpg')
        if not os.path.exists(imgfile):
            return Http404()
        else:
            # data = open(imgfile, 'rb').read()
            # return HttpResponse(content=data, content_type='image/jpg')
            return FileResponse(open(imgfile, 'rb'), content_type='image/jpg')

    def post(self, request):
        files = request.FILES
        response = []
        for key, value in files.items():
            content = value.read()
            md5 = hashlib.md5(content).hexdigest()
            path = os.path.join(settings.IMAGES_DIR, md5 + '.jpg')
            with open(path, 'wb') as f:
                f.write(content)
            response.append({
                'name': key,
                'md5': md5
            })
        message = 'post method success'
        # response = utils.response.wrap_json_response(message=message)
        response = self.wrap_json_response(data=response, message=message)

        return JsonResponse(data=response, safe=False)

    def put(self, request):
        message = 'put method success'
        # response = utils.response.wrap_json_response(message=message)
        response = self.wrap_json_response(message=message)
        return JsonResponse(data=response, safe=False)

    def delete(self, request):
        md5 = request.GET.get('md5')
        img_name = md5 + '.jpg'
        path = os.path.join(settings.IMAGES_DIR, img_name)
        if os.path.exists(path):
            os.remove(path)
            message = 'remove success'
        else:
            message = 'file (%s) not found' % img_name

        # message = 'delete method success'
        # response = utils.response.wrap_json_response(message=message)
        response = self.wrap_json_response(code=ReturnCode.SUCCESS, message=message)
        return JsonResponse(data=response, safe=False)


# def image(request):
#     if request.method == 'GET':
#         md5 = request.GET.get('md5')
#         imgfile = os.path.join(settings.IMAGES_DIR, md5 + '.jpg')
#         if not os.path.exists(imgfile):
#             return Http404()
#
#         else:
#             # data = open(imgfile, 'rb').read()
#             # return HttpResponse(content=data, content_type='image/jpg')
#             return FileResponse(open(imgfile, 'rb'), content_type='image/jpg')
#     pass


def image_text(request):
    if request.method == "GET":
        md5 = request.GET.get('md5')
        imgfile = os.path.join(settings.IMAGES_DIR, md5 + '.jpg')
        if not os.path.exists(imgfile):
            return utils.response.CommonResponseMixin.wrap_json_response(
                code=utils.response.ReturnCode.RESOURCES_NOT_EXISTS)
        else:
            response_data = {}
            response_data['name'] = md5 + '.jpg'
            response_data['url'] = 'service/image?md5=%s' % (md5)
            response = utils.response.CommonResponseMixin.wrap_json_response(data=response_data)
            return JsonResponse(data=response, safe=False)


class ImageListVIew(View, utils.response.CommonResponseMixin):
    def get(self, request):
        image_files = os.listdir(settings.IMAGES_DIR)
        response_data = []
        for image_file in image_files:
            print(image_file)
            if image_file[-4:] == '.jpg':
                response_data.append({
                    'name': image_file,
                    'md5': image_file[:-4]  # remove .jpg
                })
        print()
        response = self.wrap_json_response(data=response_data)
        print(response)
        return JsonResponse(data=response, safe=False)
