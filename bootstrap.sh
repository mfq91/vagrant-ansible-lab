#!/usr/bin/env bash
# vagrant by default creates its own keypair for all the machines. Password based authentication will be disabled by default and enabling it so password based auth can be done.
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
# Supressing the banner message everytime you connect to the vagrant box.
touch /home/vagrant/.hushlogin
# Updating the hosts file for all the 3 nodes with the IP given in vagrantfile
echo -e "192.168.10.3 ansible-master.mfq.com master\n" >> /etc/hosts
echo -e "192.168.10.4 ansible-node1.mfq.com ansible-node1\n" >> /etc/hosts
echo -e "192.168.10.5 ansible-node2.mfq.com ansible-node2" >> /etc/hosts
# Installing necessary packages 
sudo apt update && sudo apt -y install curl wget net-tools iputils-ping python3-pip sshpass dos2unix
# Install ansible using pip only in controller node
if [[ $(hostname) = "ansible-master" ]]; then
  sudo pip3 install ansible
fi