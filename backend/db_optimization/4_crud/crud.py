import os
import django
import random

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from authorization.models import User


def ranstr(length):
    CHS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    salt = ''
    for i in range(length):
        salt += random.choice(CHS)
    return salt


# Add user
def add_one():
    # 1
    user = User(open_id="test_open_id", nickname='test_nockname')
    user.save()

    ## 2
    User.objects.create(open_id='test_open_id2', nickname='test_nickname2')


# Add multiple users (speed is faster)
def add_btch():
    new_user_list = []
    for i in range(10):
        open_id = ranstr(32)
        nickname = ranstr(10)
        user = User(open_id=open_id, nickname=nickname)
        new_user_list.append(user)
    User.objects.bulk_create(new_user_list)


# query single User
def get_one():
    user = User.objects.get(open_id="test_open_id")  # can get multiple results
    print(user)


# filter
def get_filter():
    users = User.objects.filter(open_id__contains="test_")
    # open_id__startswith
    # greater than: open_id__gt
    # less than: open_id__lt
    # open_id__gte
    # open_id__lte
    print(users)


# order
def get_order():
    users = User.objects.order_by('open_id')
    print(users)


# Chain query
def get_chain():
    users = User.objects.filter(open_id__contains="test_").order_by('open_id')
    print(users)


# Modify one
def modify_one():
    user = User.objects.get(open_id='test_open_id')
    user.nickname = "modified_username"
    user.save()


# Modify Multiple
def modify_batch():
    User.objects.filter(open_id__contains="test_").update(nickname="modify_nickname")


# delete one
def delete_one():
    User.objects.get(open_id='test_open_id').delete()


# delete multiple
def delete_batch():
    User.objects.filter(open_id__contains="test_").delete()


# delete_all
def delete_all():
    User.objects.all().delete()


# -------------------
# DataBase function
from django.db.models import Value
from django.db.models.functions import Concat


def contact_function():
    user = User.objects.filter(open_id='test_open_id').annotate(
        # open_id=(open_id), nickname=(nickname)
        screen_name=Concat(
            Value('open_id='),
            "open_id",
            Value(","),
            Value("nickname="),
            "nickname"
        )
    )
    pass


if __name__ == '__main__':
    # add_one()
    # add_btch()
    # get_one()
    # get_filter()
    # get_order()
    # get_chain()

    modify_one()
