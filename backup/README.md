# Make a backup of your Pi via rsync over ssh

Voorwaarden:
- rsync-backup.sh in root
- rsync-exclude.txt in root
- rsa key aangemaakt
- config in .ssh voor juiste user
- crontab

##Crontab
	# Regeltje toevoegen aan crontab via crontab -e
	15 1 * * *	/root/rsync-backup.sh

De backup gaat over ssh dus op de pi moet een key gegenereerd worden.

```
	root@rpi-b:~# **ssh-keygen**
	Generating public/private rsa key pair.
	Enter file in which to save the key (/root/.ssh/id_rsa): **/root/.ssh/id_rsa_backup**
	Enter passphrase (empty for no passphrase): 
	Enter same passphrase again: 
	Your identification has been saved in /root/.ssh/id_rsa_backup.
	Your public key has been saved in /root/.ssh/id_rsa_backup.pub.
	root@rpi-b:~# 
```

##config
config file van ssh: ~/.ssh/config

```
	vi /root/.ssh/config
	Host=backupserver
		Hostname=backupserver.com
		User=backup
		IdentityFile /root/.ssh/id_rsa_backup
```

deze key moet bij de backup-server in de backup user dir gezet worden

```
	vi /home/backup/.ssh/authorized_keys
	[insert id_rsa_backup.pub]
```
