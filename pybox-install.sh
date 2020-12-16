#!/bin/bash
set -x
#sudo chown vagrant /home/vagrant/.ssh/id_rsa
#sudo chmod 400 /home/vagrant/.ssh/id_rsa
#ssh-keyscan -H localhost >> /home/vagrant/.ssh/known_hosts
sudo sed -i 's%us.archive.ubuntu.com%mirror.yandex.ru%' /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install python-minimal
sudo apt-get install software-properties-common -y
sudo apt-get install python3-software-properties -y
#sudo apt-get install default-jdk unzip python-lxml -y
sudo apt-get dist-upgrade -y
sudo apt-get update
sudo apt-get autoremove -y
#sudo apt-get clean
#sudo dd if=/dev/zero of=/EMPTY bs=1M
#sudo rm -f /EMPTY
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget -q --no-check-certificate \
  https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
  -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
cat /home/vagrant/.ssh/authorized_keys
rm -v /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server
systemctl restart ssh
{
  echo "#!/bin/bash"
  echo "source /usr/local/bin/ssh-hostkeys-run-once-script"
} | tee -a /etc/rc.local
ls -l /etc/rc.local
chmod a+x /etc/rc.local
ls -l /etc/rc.local
cat /etc/rc.local
mkdir -p /usr/local/bin
{
  echo "#!/bin/bash"
  echo "if [ ! -f /etc/ssh/ssh_host_rsa_key ] ; then"
    echo "  dpkg-reconfigure openssh-server"
    echo "  systemctl restart ssh"
#    echo "  rm /usr/local/bin/ssh-hostkeys-run-once-script"
  echo "fi"
} | tee -a /usr/local/bin/ssh-hostkeys-run-once-script
chmod a+x /usr/local/bin/ssh-hostkeys-run-once-script
ls -l /usr/local/bin/ssh-hostkeys-run-once-script
cat /usr/local/bin/ssh-hostkeys-run-once-script
chown -R vagrant /home/vagrant/.ssh
cat /dev/null > ~/.bash_history && history -c
