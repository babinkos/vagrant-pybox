# vagrant-pybox
*steps to prepare tuned virtualbox box based on ubuntu/xenial64
 but with mirror.yandex.ru and installed packages:
default-jdk,unzip,python-minimal, software-properties-common, python-software-properties*

```sh
git init
git remote add -f origin https://github.com/babinkos/vagrant-pybox.git
git pull origin master
vagrant up
vagrant package --output pybox.box
vagrant box add pybox pybox.box
vagrant destroy -f
echo "You can use now: "
echo " boxname = 'pybox'"
echo "in your Vagrantfile"
```

Use vbox-prepare.cmd or vbox-prepare.sh script to simply run this commands

To remove customized box, run: 
```sh
vagrant box remove pybox
```