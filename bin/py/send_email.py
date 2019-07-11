#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description: 发送邮件

from email.mime.text import MIMEText
from email.header import Header
from urllib.parse import urlparse
import os
import sys
import smtplib
import traceback
import argparse

class Email():
    def __init__(self, smtp_host, smtp_port, user, password, sender,
            sender_name, **kwargs):
        kw = locals()
        kw.pop('self')
        for k, v in kw.items():
            setattr(self, k, v)

    def connect(self):
        '''建立连接'''
        try:
            smtpObj = smtplib.SMTP()
            smtpObj.connect(self.smtp_host, self.smtp_port)
            smtpObj.login(self.user, self.password)

            self.client = smtpObj
            self.sender = self.sender
            self.sender_name = self.sender_name
        except smtplib.SMTPException as e:
            traceback.print_exc(e)

    def send(self, receivers,  subject, message, maintype='plain', cc=[]):
        '''
        发送邮件
        '''
        self.connect()
        message = MIMEText(message, maintype, 'utf-8')
        message['From'] = Header(self.sender_name, 'utf-8')
        message['To'] = Header(','.join(receivers), 'utf-8')
        if cc:
            message['Cc'] = Header(','.join(cc), 'utf-8')
        #  message['Bcc'] = Header(','.join(receivers), 'utf-8')
        message['Subject'] = Header(subject, 'utf-8')
        receivers.extend(cc)
        try:
            self.client.sendmail(self.sender, receivers,
                message.as_string())
            self.client.quit()
            return True
        except Exception as e:
            traceback.format_exc(e)
            self.client.quit()
            return False

def init_args():
    parser = argparse.ArgumentParser('Send email')
    parser.add_argument("emails", type=str, help='Receive emails')
    parser.add_argument('-s', '--subject', type=str, required=True, help='Email subject')
    parser.add_argument('-t', '--text', type=str, help='Email content')

    return parser.parse_args()

if __name__ == '__main__':
    print(os.environ.get("smtp_url"))
    url_config = urlparse(os.getenv("smtp_url"))
    args = init_args()
    smtp_host = url_config.hostname
    print(smtp_host)
    smtp_port = url_config.port
    user = os.getenv("from")               # 发送方邮箱
    password = os.getenv("smtp_pass")  # 发送方密码
    sender = os.getenv("from")             # 发送方邮箱
    sender_name = 'wxnacy'         # 发送方名称
    email_args = dict(locals())
    email_args.pop('url_config')
    email_args.pop('args')

    e = Email(**email_args)
    receivers = [args.emails.split(',')]         # 接收方邮箱
    subject = args.subject
    msg = args.text
    e.send(receivers, subject, msg)

