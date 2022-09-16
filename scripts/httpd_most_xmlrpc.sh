#!/bin/bash

cat /var/log/httpd/access_log |grep xmlrpc |cut -f 1 -d ' '|sort |uniq -c |sort -hr |head -n 20
