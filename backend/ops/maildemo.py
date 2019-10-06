import os
import django
from email.mime.text import MIMEText
from backend import settings
import smtplib

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "backend.settings")
django.setup()


def send_mail():
    msg = MIMEText("Email port test", 'plain', 'utf-8')
    msg['FROM'] = 'Mail Test'
    msg['Subject'] = '[Mail Test]'
    receivers = ['liucy9511@gmail.com']
    server = smtplib.SMTP_SSL(settings.EMAIL_HOST, settings.EMAIL_PORT)
    # server.starttls() # if use port 587 and STMP, then have to have this line
    server.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
    server.sendmail(settings.EMAIL_FROM, receivers, msg.as_string())
    server.close()
    pass


if __name__ == '__main__':
    send_mail()
