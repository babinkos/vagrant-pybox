#!/bin/bash
docker run -it --rm \
  -e LIBVIRT_DEFAULT_URI \
  -e VAGRANT_LIBVIRT_VIRT_SYSPREP_OPERATIONS='defaults,-ssh-userdir,-customize,-ssh-hostkeys' \
  -v /var/run/libvirt/:/var/run/libvirt/ \
  -v ~/.vagrant.d:/.vagrant.d \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  vagrantlibvirt/vagrant-libvirt:latest \
    vagrant "$@"
