import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from authorization.models import User


# Add user
def add_one():
    # 1
    user = User(open_id="test_open_id", nickname='test_nockname')
    user.save()

    ## 2
    User.objects.create(open_id='test_open_id2', nickname='test_nickname2')


if __name__ == '__main__':
    add_one()
