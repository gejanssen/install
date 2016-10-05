# First steps after installing a raspberry pi

## Package management
Usage:
```
	sudo bash update.sh
	sudo bash packages.sh
```

update packages
removing packages
adding new packages
adding vim etc.
mogelijk sudo update-alternatives --config vi


## Creating users
import ssh keys
creating users
editing visudo

usage:
```
	sudo bash users.sh
```

Todo, iets met wachtwoorden.

## Install Apache

usage:
```
	sudo bash apache.sh
```

### Install Apache certificaat

Kopeer het certificaat, de key en de root-bundle naar /etc/ssl/private
Enable de ssl module
```
sudo a2enmod ssl
```

Enable de 000-default-ssl.conf
```
sudo ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/000-default-ssl.conf
```

maak de juiste koppeling naar de keys en certificaten

vi 000-default-ssl.conf
```
	SSLCertificateFile	/etc/ssl/private/home.graat.info.crt
	SSLCertificateKeyFile	/etc/ssl/private/home.graat.info.key
	SSLCACertificateFile	/etc/ssl/private/root_bundle.crt
```

Restart de webserver

```
sudo systemctl restart apache2.service
```

## Install mariadb

usage:
```
	sudo bash mariadb.sh
```

## Serial
Bij een raspberry Pi 3 doet de serial raar.
Hiervoor moet je een fixed core freq opgeven in de /boot/config.txt
"core_freq=250"

usage
```
	$ sudo ./rpib3.sh
```

