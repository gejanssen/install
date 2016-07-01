sudo useradd -c "Ge Janssen" -d /home/gej -m -s /bin/bash gej
sudo useradd -c "Jos Nouwen" -d /home/josn -m -s /bin/bash josn

su - gej -c "ssh-import-id gej"
su - josn -c "ssh-import-id josn"

echo 'gej	ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'josn	ALL=(ALL:ALL) ALL' >> /etc/sudoers
