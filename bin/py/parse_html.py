#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description:

from requests_html import HTMLSession
session = HTMLSession()
r = session.get('http://www.yyetss.com/detail-9.html')

#  print(r.html.find('a'))

#  res = r.html.find('a')
#  for line in res:
    #  print(line)

res = r.html.find('div.tab_set_info a')
print(res)
for line in res:
    #  print(line.links.get(0))
    links = list(line.links)
    print(links[0])
