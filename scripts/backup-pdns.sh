#!/bin/bash

#set -x

DATE=`date +%F_%T`
echo Begin Import Zones at $DATE

ls /var/backup/powerdns-backup-* | sort | head -n -8760 | xargs rm -f

mysqldump powerdns > /var/backup/powerdns-backup-$DATE.sql                                      && \
bzip2 -f /var/backup/powerdns-backup-*.sql

echo -e End Import Zones at `date +%F_%T` "\n\n\n"
