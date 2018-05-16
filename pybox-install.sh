#!/bin/bash
sudo chown vagrant /home/vagrant/.ssh/id_rsa
sudo chmod 400 /home/vagrant/.ssh/id_rsa
#ssh-keyscan -H localhost >> /home/vagrant/.ssh/known_hosts
sudo sed -i 's%deb http://us.archive.ubuntu.com%deb http://by.archive.ubuntu.com%' /etc/apt/sources.list
sudo sed -i 's%deb http://archive.ubuntu.com%deb http://by.archive.ubuntu.com%' /etc/apt/sources.list
#sudo sed -i 's%archive.ubuntu.com%mirror.yandex.ru%' /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install python-minimal
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
#sudo apt-get install default-jdk unzip python-lxml -y
sudo apt-get dist-upgrade -y
sudo apt-get update
sudo apt-get autoremove
#sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c
