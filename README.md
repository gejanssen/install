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

