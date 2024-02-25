#dpkg-query -l ssh-import-id

if [ $(dpkg-query -W -f='${Status}' ssh-import-id 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install ssh-import-id;
fi



set -x
sudo useradd -c "Ge Janssen" -d /home/gej -m -s /bin/bash gej
sudo useradd -c "Jos Nouwen" -d /home/josn -m -s /bin/bash josn

sudo su - gej -c "ssh-import-id gej"
sudo su - josn -c "ssh-import-id josn"


echo 'gej ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers.d/gej > /dev/null
echo 'josn ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers.d/josn > /dev/null
