#!/bin/bash
chown vagrant /home/vagrant/.ssh/id_rsa
chmod 400 /home/vagrant/.ssh/id_rsa
ssh-keyscan -H localhost >> /home/vagrant/.ssh/known_hosts
sudo sed -i 's%archive.ubuntu.com%mirror.yandex.ru%' /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install python-minimal
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo apt-get install default-jdk -y
sudo apt-get install unzip -y
sudo apt dist-upgrade
sudo apt-get update
sudo apt-get autoremove