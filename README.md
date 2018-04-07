# vagrant-pybox
#steps to prepare tuned virtualbox box based on ubuntu/xenial64 but with mirror.yandex.ru and installed 
#default-jdk,unzip,python-minimal, software-properties-common, python-software-properties


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