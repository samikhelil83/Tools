#!/bin/bash

cat /var/log/maillog |grep from= |awk {'print $6'} |sort |uniq -c |sort -hr |head -n 20
