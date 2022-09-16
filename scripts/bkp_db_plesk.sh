#!/bin/bash

/usr/sbin/plesk db dump psa > /opt/topnet/backup/psa.`date +%F_%H.%M`.sql
