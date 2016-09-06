# Backup script maria db

## Voorwaarden
- .my.cnf gevuld met mysqldump gegevens
- .my.cnf met het juiste wachtwoord
- backup.sh uitgevoerd met sudo of root

## Voorbeeld Crontab
om 01:00 uur de backup van Mysql
crontab -e
```
0 1 * * *	/root/backup_db.sh
```

of

```
5 0 * * *       /home/pi/install/mariadb/backup_db.sh
```
