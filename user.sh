#dpkg-query -l ssh-import-id

if [ $(dpkg-query -W -f='${Status}' ssh-import-id 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install ssh-import-id;
fi



set -x
sudo useradd -c "Ge Janssen" -d /home/gej -m -s /bin/bash gej
sudo useradd -c "Jos Nouwen" -d /home/josn -m -s /bin/bash josn

su - gej -c "ssh-import-id gej"
su - josn -c "ssh-import-id josn"

echo 'gej	ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
echo 'josn	ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
