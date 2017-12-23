set -x
# Debian jessie - PHP5
#sudo apt --assume-yes install apache2 php5 php-pear 
# Debian Stretch - PHP 7.0
#sudo apt --assume-yes install apache2 php7.0 php-pear 

if [ $( cat /etc/os-release | grep -c "stretch") -eq 2 ];
then
  echo Debian Stretch
  sudo apt --assume-yes install apache2 php7.0 php-pear 
else
  echo Ouder dan stretch
  sudo apt --assume-yes install apache2 php5 php-pear 
fi



########## ssl #############
#sudo a2enmod ssl
#sudo ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/000-default-ssl.conf
echo Lees de readme voor het certificaat te installeren.
