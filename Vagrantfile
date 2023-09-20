# -*- mode: ruby -*-
# vi: set ft=ruby :

# VARIABLES
ANSIBLE_MANAGED_NODES = 2 
IP_NW = "192.168.10."
NODE_IP_START = 3
DEFAULT_BOX = "ubuntu/jammy64"
ANSIBLE_MASTER_MEMORY = 1024
ANSIBLE_MASTER_CPUS = 1
ANSIBLE_MANAGED_NODES_MEMORY = 1024
ANSIBLE_MANAGED_NODES_CPUS = 1
# ANSIBLE MASTER NODE
Vagrant.configure("2") do |config|  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = ANSIBLE_MASTER_MEMORY
    rs.cpus = ANSIBLE_MASTER_CPUS
  end
  config.vm.box_check_update = false
  config.vm.define "ansible_master" do |ansible_master|
    ansible_master.vm.box = "#{DEFAULT_BOX}"
    ansible_master.vm.hostname = "ansible-master.mfq.com"
    ansible_master.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-master"
    end
    ansible_master.vm.network "private_network", ip: "192.168.10.3"
    ansible_master.vm.provision "shell", path: "bootstrap.sh"
    ansible_master.vm.provision "file", source: "key_gen.sh", destination: "/home/vagrant/"
  end
# ANSIBLE MANAGED NODES
  (1..ANSIBLE_MANAGED_NODES).each do |i|
    config.vm.define "ansible_node#{i}" do |node|
        node.vm.provider "virtualbox" do |vb|
            vb.name = "ansible-node#{i}"
            vb.memory = ANSIBLE_MANAGED_NODES_MEMORY
            vb.cpus = ANSIBLE_MANAGED_NODES_CPUS
        end
        node.vm.box = "#{DEFAULT_BOX}"
        node.vm.hostname = "ansible-node#{i}.mfq.com"
        node.vm.network "private_network", ip: IP_NW + "#{NODE_IP_START + i}"
        node.vm.provision "shell", path: "bootstrap.sh"
    end
  end
end