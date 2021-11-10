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
Automatisch installeren van ssh-import-id

Todo, iets met wachtwoorden.

## Enable IO
Enable SPI
Enable 1Wire
Enable I2C

```
	sudo io.sh
```
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

## Timezone

Setting the timezone to europe/amsterdam

```
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
```

or

```
$ ./timezone.sh
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
### Config serial over usb (Pi zero - otg poort serial)

Found:
https://gist.github.com/gbaman/50b6cca61dd1c3f88f41
and
https://gist.github.com/gbaman/975e2db164b3ca2b51ae11e45e8fd40a

```
echo "dtoverlay=dwc2" >> /boot/config.txt
```

cmdline.txt
Insert modules-load=dwc2,g_serial after rootwait.

and then:
```
sudo systemctl enable getty@ttyGS0.service
```
and
```
sudo systemctl start getty@ttyGS0.service
```

And then on my notebook

```
gej@pluto:~$ dmesg
[ 9426.440495] usb 1-1.2: new high-speed USB device number 14 using ehci-pci
[ 9426.808473] usb 1-1.2: new high-speed USB device number 15 using ehci-pci
[ 9426.917912] usb 1-1.2: New USB device found, idVendor=0525, idProduct=a4a7
[ 9426.917918] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 9426.917921] usb 1-1.2: Product: Gadget Serial v2.4
[ 9426.917923] usb 1-1.2: Manufacturer: Linux 4.9.41+ with 20980000.usb
[ 9426.919220] cdc_acm 1-1.2:2.0: ttyACM0: USB ACM device
gej@pluto:~$

gej@pluto:~$ cu -l /dev/ttyACM0 -s 115200 
```


### Disable Wifi Raspberry Pi Zero W
Ik heb een Pi met defekte wifi.

The other thing I can think of is to disable the loading of the drivers for now:

/etc/modprobe.d/raspi-blacklist.conf

#wifi
blacklist brcmfmac
blacklist brcmutil
#bt
blacklist btbcm
blacklist hci_uart

or via config.txt

for disable onboard WiFi and BT on Pi3 add to config.txt

Code: Select all

dtoverlay=pi3-disable-wifi
dtoverlay=pi3-disable-bt



### Autoconfig

(Update, download rpi-imager in linux and use ctrl-shift-x to edit advanced settings)

From the documentation of raspberry pi:
or headless setup, SSH can be enabled by placing a file named 'ssh', without any extension, onto the boot partition of the SD card. When the Pi boots, it looks for the 'ssh' file; if it is found, SSH is enabled and then the file is deleted. The content of the file doesn't matter: it could contain either text or nothing at all.

```
echo ; > /boot/ssh
```

There are some great answers here, but many are out of date. Since May 2016, Raspbian has been able to copy wifi details from /boot/wpa_supplicant.conf into /etc/wpa_supplicant/wpa_supplicant.conf to automatically configure wireless network access:

    If a wpa_supplicant.conf file is placed into the /boot/ directory, this will be moved to the /etc/wpa_supplicant/ directory the next time the system is booted, overwriting the network settings; this allows a Wifi configuration to be preloaded onto a card from a Windows or other machine that can only see the boot partition.

    The latest update to Raspbian - Raspberry Pi

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

### For the raspberry Pi zero 2, 64bits kernel

Edit this in your boot.txt
```
pi02]
 # entry for zero 2 W
 # First: check if bcm2710-rpi-zero-2.dtb exists.
 # if not: cp /boot/bcm2710-rpi-3-b.dtb /boot/bcm2710-rpi-zero-2.dtb
arm_64bit=1
[all]
```

