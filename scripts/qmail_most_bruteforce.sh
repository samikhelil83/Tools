#!/bin/bash


cat /var/log/maillog |grep FAILED |cut -f 13 -d ' '|sort |uniq -c |sort -hr |head -n 20
