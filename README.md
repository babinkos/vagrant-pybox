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

## Libvirt (aks Quemu/KVM) specifics
In case of libvirt (aks quemu/kvm) provider - see patch package_domain.rb.patch needed for vagrant-libvirt-0.0.43 to solve an issue,
when virt-sysprep cleanup called by LIBGUESTFS after "vagrant package" triggered, it also removes ssh host keys from vbox image though preventing sshd to start.
That was reason of Vagrant failure to provision sysprepped image via ssh - it was unreachable until new host keys generated (via vm console).

Newer version (0.3.0) get use of environment variable VAGRANT_LIBVIRT_VIRT_SYSPREP_OPERATIONS with default value set to 'defaults,-ssh-userdir,-customize',
so in order to prepare new Vagrant box just extend this value with '-ssh-hostkeys'
see : https://github.com/vagrant-libvirt/vagrant-libvirt/blob/d0787c803dd926e36f779045e2ec507a88b6e9a8/lib/vagrant-libvirt/action/package_domain.rb#L53
and : https://github.com/vagrant-libvirt/vagrant-libvirt#using-docker-based-installation

no need to define any extra vars preliminary, typically it's already set, see example:
```sh
echo $LIBVIRT_DEFAULT_URI
qemu:///system
```
then you can use this docker-image, see wrapper script "vagrant-libvirt.sh", to run "vagrant package" (so vbox-prepare.sh script should point to it rather that vagrant):
```bash
docker run -it --rm \
  -e LIBVIRT_DEFAULT_URI \
  -e VAGRANT_LIBVIRT_VIRT_SYSPREP_OPERATIONS='defaults,-ssh-userdir,-customize,-ssh-hostkeys' \
  -v /var/run/libvirt/:/var/run/libvirt/ \
  -v ~/.vagrant.d:/.vagrant.d \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  vagrantlibvirt/vagrant-libvirt:latest \
    vagrant "$@"
```


# TODO:
- add check whether libvirt provider is used in scripts to run appropriate version
