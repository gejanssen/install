# Backup script maria db

## Voorwaarden
- .my.cnf gevuld met mysqldump gegevens
- .my.cnf met het juiste wachtwoord
- backup.sh uitgevoerd met sudo of root

## Voorbeeld Crontab
om 01:00 uur de backup van Mysql
```
0 1 * * *	/root/backup_db.sh
```

