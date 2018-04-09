#!/bin/sh
vagrant up
vagrant package --output pybox.box
vagrant box add pybox pybox.box
vagrant destroy -f
echo "You can use now: "
echo " boxname = 'pybox'"
echo "in your Vagrantfile"

