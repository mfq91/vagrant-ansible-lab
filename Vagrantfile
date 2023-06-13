# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  config.vm.box_check_update = false

  # Master node where ansible will be installed
  config.vm.define "ansible_master" do |ansible_master|
    ansible_master.vm.box = "ubuntu/jammy64"
    ansible_master.vm.hostname = "controller.anslab.com"
    ansible_master.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-master"  # Nombre de la máquina en VirtualBox
    end
    ansible_master.vm.network "private_network", ip: "192.168.10.3"
    ansible_master.vm.provision "shell", path: "bootstrap.sh"
    ansible_master.vm.provision "file", source: "key_gen.sh", destination: "/home/vagrant/"
  end

  # Managed node 1.
  config.vm.define "ansible_node1" do |ansible_node1|
    ansible_node1.vm.box = "ubuntu/jammy64"
    ansible_node1.vm.hostname = "managed1.anslab.com"
    ansible_node1.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-node1"  # Nombre de la máquina en VirtualBox
    end
    ansible_node1.vm.network "private_network", ip: "192.168.10.4"
    ansible_node1.vm.provision "shell", path: "bootstrap.sh"
  end

  # Managed node 2.
  config.vm.define "ansible_node2" do |ansible_node2|
    ansible_node2.vm.box = "ubuntu/jammy64"
    ansible_node2.vm.hostname = "managed2.anslab.com"
    ansible_node2.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-node2"  # Nombre de la máquina en VirtualBox
    end
    ansible_node2.vm.network "private_network", ip: "192.168.10.5"
    ansible_node2.vm.provision "shell", path: "bootstrap.sh"
  end

end
