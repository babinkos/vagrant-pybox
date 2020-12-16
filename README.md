# vagrant-pybox

## This customized box with python installed is useful to test Ansible roles with Vagrant

*steps to prepare tuned virtualbox box based on ubuntu/bionix64 (18.04)
 but with mirror.yandex.ru and installed packages:
python-minimal, software-properties-common, python3-software-properties*

```sh
git clone https://github.com/babinkos/vagrant-pybox.git
cd vagrant-pybox
./vbox-prepare.sh
```

Use vbox-prepare.cmd on Windows

To remove customized box, run:
```sh
vagrant box remove pybox
```
