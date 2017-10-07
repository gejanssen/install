# Set password for root
Nowadays on a Pi, the root user does not have a password.

Please set the password:

## Set Passwd
```
        
root@rpi-zw2:/home/pi/install# mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 2
Server version: 10.1.23-MariaDB-9+deb9u1 Raspbian 9.0

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use mysql
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [mysql]> update user set password=PASSWORD('ErgMoeilijk13') WHERE user='root' and host = 'localhost';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [mysql]> flush privileges;
Query OK, 0 rows affected (0.01 sec)

MariaDB [mysql]> exit
Bye
root@rpi-zw2:/home/pi/install#

```
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

En natuurlijk de restore:

```
$ gunzip dump-2016-10-05_01-00-02.sql.gz 
$ mysql < dump-2016-10-05_01-00-02.sql
```
