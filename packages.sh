set -x
sudo apt-get -y install vim screen ssh-import-id
#sudo apt-get -y install ssh-import-id


# verwijderen van oude software
sudo apt-get -y remove minecraft-pi sonic-pi wolfram-engine
sudo apt-get -y autoremove

