#!/bin/bash
# verwijderen van oude backups (laat de laatste 4 files staan)
## # weghalen waar je de database dumpt.
#/bin/ls /root/dump*gz | /usr/bin/head -n-4 | /usr/bin/xargs rm

# Maak een nieuwe backup
# Denk aan de correcte .my.cnf
/usr/bin/mysqldump --all-databases | /bin/gzip -9 > /root/dump-$( date '+%Y-%m-%d_%H-%M-%S' ).sql.gz

