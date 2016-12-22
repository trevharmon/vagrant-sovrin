# -*- mode: ruby -*-
# vi: set ft=ruby :

# Make sure to be using the vagrant-vbguest plugin

Vagrant.configure("2") do |config|

  config.vm.define "centos7" do |centos7|
#    centos7.vbguest.auto_update = false
    centos7.vm.box       = "centos/7"
    centos7.vm.host_name = "centos7.sovrin.lab"
    centos7.vm.network "forwarded_port", guest: 22, host: 2200, auto_correct: true
    centos7.vm.network "forwarded_port", guest: 80, host: 8000, auto_correct: true
    centos7.vm.network "private_network", ip: "10.42.111.100"
    centos7.vm.network "public_network"
    centos7.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    centos7.ssh.insert_key       = false
    centos7.vm.provider "virtualbox" do |vb|
      vb.name   = "centos7"
      vb.gui    = false
      vb.memory = "1024"
      vb.cpus   = "1"
    end
    centos7.vm.provision "packages", type: "shell", path: "scripts/centos7_packages.sh"
    centos7.vm.provision "sovrin",   type: "shell", path: "scripts/centos7_sovrin.sh"
#    centos7.trigger.after :up do
#      run "vagrant vbguest --auto-reboot --no-provision"
#      centos7.vm.synced_folder ".","/vagrant", type: "virtualbox"
#    end
  end

  config.vm.define "xenial" do |xenial|
    xenial.vm.box       = "boxcutter/ubuntu1604"
    xenial.vm.host_name = "xenial.sovrin.lab"
    xenial.vm.network "forwarded_port", guest: 22, host: 2201, auto_correct: true
    xenial.vm.network "forwarded_port", guest: 80, host: 8001, auto_correct: true
    xenial.vm.network "private_network", ip: "10.42.111.101"
    xenial.vm.network "public_network"
    xenial.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    xenial.ssh.insert_key       = false
    xenial.vm.provider "virtualbox" do |vb|
      vb.name   = "xenial"
      vb.gui    = false
      vb.memory = "1024"
      vb.cpus   = "1"
    end
    xenial.vm.provision "packages", type: "shell", path: "scripts/xenial_packages.sh"
    xenial.vm.provision "sovrin",   type: "shell", path: "scripts/xenial_sovrin.sh"
  end

end
