import os
import django


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from backend_ch1_sec1.authorization.models import Users




if __name__ == '__main__':
    pass
