# -*- mode: ruby -*-
# vi: set ft=ruby :

# old box name was "ubuntu/xenial64" and new bento/ubuntu-16.04 but very slow from vagrantcloud, reverted
boxname = "ubuntu/xenial64"
Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.define "pybox" do |pybox|
    pybox.vm.hostname = "pybox"
    pybox.vm.box = boxname
    pybox.vm.network :private_network, ip: "192.168.56.113"
    pybox.vm.provision "file", source: "#{Dir.home}/.vagrant.d/insecure_private_key", destination: "/home/vagrant/.ssh/id_rsa"
    pybox.vm.provision "shell", path: "pybox-install.sh"
  end
end