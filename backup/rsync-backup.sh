#!/bin/bash
# script to synchronise Pi files to backup
/usr/bin/rsync --exclude-from=/root/rsync-exclude.txt -avhPS --delete --log-file=/var/log/rsync.log / backup@backupserver.com:/home/backup/rpipce
if [[ $? -gt 0 ]]
then
   # take failure action here
   echo "Error at `/bin/date`" > /var/log/rsync-error.log
else
   # All Ok.
   echo "Done"
fi
