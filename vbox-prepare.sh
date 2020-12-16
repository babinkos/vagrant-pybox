#!/bin/bash
set -ex
sudo hostname
vagrant up
[ "$( stat --format %a /var/lib/libvirt/images/vagrant-pybox_pybox.img)" == "644" ] || sudo chmod a+r /var/lib/libvirt/images/vagrant-pybox_pybox.img
vagrant halt
#dpkg-statoverride --update --add root root 0644 /boot/vmlinuz-`uname -r`
KERNVER=$(uname -r)
[ "$( stat --format %a /boot/vmlinuz-${KERNVER} )" == "644" ] || sudo chmod 644 /boot/vmlinuz-${KERNVER}
#LIBGUESTFS_DEBUG=1 LIBGUESTFS_TRACE=1
vagrant package --output pybox.box 2>&1 | tee /tmp/pybox-package.log
vagrant box add pybox pybox.box --force
vagrant destroy -f
rm pybox.box
sudo virsh vol-delete pybox_vagrant_box_image_0.img --pool default
sudo rm -v /var/lib/libvirt/images/vagrant-pybox_pybox.img
#echo "You can use now: "
#echo " boxname = pybox"
#echo "in your Vagrantfile"
