#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description:

import subprocess
import shlex
from decimal import Decimal

def get_request_time(url):
    cmd = '''
    curl -sIL -w "{} {} {} {} {} {} {}" -o /dev/null {}
    '''.format('%{time_namelookup}', '%{time_connect}', '%{time_appconnect}',
        '%{time_redirect}', '%{time_pretransfer}', '%{time_starttransfer}',
        '%{time_total}', url)
    cmds = shlex.split(cmd)
    p = subprocess.Popen(cmds, stdout=subprocess.PIPE)
    p.wait()
    byte_data = p.stdout.read()
    p.stdout.close()
    time = byte_data.decode('utf-8')
    return time.split(" ")

if __name__ == "__main__":
    import sys
    args = sys.argv[1:]
    if len(args) < 1:
        raise Error('url not null')
    url = args[0]
    times = get_request_time(url)
    dns = Decimal(times[0])
    conn = Decimal(times[1])
    tcp = conn - dns
    app_conn = Decimal(times[2])
    ssl = app_conn - conn if app_conn > 0 else 0
    pretransfer = Decimal(times[4])
    starttransfter = Decimal(times[5])
    total = Decimal(times[6])
    server = starttransfter - pretransfer
    data_trans = total - starttransfter
    l1 = ' {:0.6f}  {:0.6f}  {:0.6f}  {:0.6f}  {:0.6f}'.format(
        dns, tcp, ssl, server, data_trans)
    l3 = '|-- DNS --|-- TCP --|-- SSL --|-- SVR --|-- DTS --|'
    l4 = '|------------------ TOTAL {:0.6f} ---------------|'.format(total)
    print(l1)
    print(l3)
    print(l4)

