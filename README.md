# First steps after installing a raspberry pi

```
pi@raspberrypi:~ $ git clone https://github.com/gejanssen/install
Cloning into 'install'...
remote: Counting objects: 113, done.
remote: Total 113 (delta 0), reused 0 (delta 0), pack-reused 113
Receiving objects: 100% (113/113), 12.12 KiB | 0 bytes/s, done.
Resolving deltas: 100% (51/51), done.
Checking connectivity... done.
pi@raspberrypi:~ $ 
```
### Locale
installing nl locales

usage:
```
./locale.sh
```

## Package management
Usage:
```
sudo bash update.sh
sudo bash packages.sh
```

* update packages
* removing packages
* adding new packages
* adding vim etc.
* mogelijk sudo update-alternatives --config vi


## Creating users
* import ssh keys
* creating users
* editing visudo

usage:
```
sudo bash users.sh
```

Todo, iets met wachtwoorden.

## Install Apache

Let op, bij Debian Stretch is de default php7.0, als je 5 wil, even editen.

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
SSLCertificateFile	/etc/ssl/private/certificate.crt
SSLCertificateKeyFile	/etc/ssl/private/certificate-key.key
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

## Install Xymon Client
```
./xymon.sh
```
(eventueel nog met de hand de server opgeven)
```
root@raspberrypi:/home/pi/install# vi /etc/default/xymon-client
root@raspberrypi:/home/pi/install# systemctl restart xymon-client.service
root@raspberrypi:/home/pi/install#
```

## Nexdock
Om automatisch de nexdock bluetooth keyboard/mouse te connecten:

```
#echo "connect 0C:FC:83:00:1E:B6" | bluetoothctl
```

oftewel

```
./nexdock.sh
```


### Autoconfig

From the documentation of raspberry pi:
or headless setup, SSH can be enabled by placing a file named 'ssh', without any extension, onto the boot partition of the SD card. When the Pi boots, it looks for the 'ssh' file; if it is found, SSH is enabled and then the file is deleted. The content of the file doesn't matter: it could contain either text or nothing at all.

```
echo ; > /boot/ssh
```

There are some great answers here, but many are out of date. Since May 2016, Raspbian has been able to copy wifi details from /boot/wpa_supplicant.conf into /etc/wpa_supplicant/wpa_supplicant.conf to automatically configure wireless network access:

    If a wpa_supplicant.conf file is placed into the /boot/ directory, this will be moved to the /etc/wpa_supplicant/ directory the next time the system is booted, overwriting the network settings; this allows a Wifi configuration to be preloaded onto a card from a Windows or other machine that can only see the boot partition.

    — The latest update to Raspbian - Raspberry Pi

Since the /boot partition is accessible by any computer with an SD card reader, wifi configuration is now much simpler.

A skeleton /etc/wpa_supplicant/wpa_supplicant.conf file can be as little as:

network={
    ssid="YOUR_SSID"
    psk="YOUR_PASSWORD"
    key_mgmt=WPA-PSK
}

Hostname


/etc/hostname
en
/etc/hosts


Edit the os/Rasbian/os.json file. It should look like this :

{
  "name": "Raspbian",
  "version": "wheezy",
  "release_date": "2015-02-16",
  "kernel": "3.18",
  "description": "A community-created port of Debian wheezy, optimised for the Raspberry Pi",
  "url": "http://www.raspbian.org/",
  "username": "pi",
  "password": "raspberry",
  "supported_hex_revisions": "2,3,4,5,6,7,8,9,d,e,f,10,11,12,14,19,1040,1041"
}

