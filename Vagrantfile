# -*- mode: ruby -*-
# vi: set ft=ruby :

# old box name was "ubuntu/xenial64" and new bento/ubuntu-16.04 but it have fetched very slow from vagrantcloud, reverted
boxname = "ubuntu/xenial64"
Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.provider "libvirt" do |v, override|
    boxname = "generic/ubuntu1804"
  end
  config.nfs.verify_installed = false
  config.vm.synced_folder '.', '/vagrant', disabled: true
  #  config.vm.box_version = "=20180406.0.0"
  config.vm.define "pybox" do |pybox|
    pybox.vm.hostname = "pybox"
    pybox.vm.box = boxname
    pybox.vm.provision "shell", path: "pybox-install.sh"
  end
end
