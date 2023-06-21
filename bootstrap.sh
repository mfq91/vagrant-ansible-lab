#!/usr/bin/env bash

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

touch /home/vagrant/.hushlogin

echo -e "192.168.10.3 ansible-master.mfq.com master\n" >> /etc/hosts
echo -e "192.168.10.4 ansible-node1.mfq.com ansible-node1\n" >> /etc/hosts
echo -e "192.168.10.5 ansible-node2.mfq.com ansible-node2" >> /etc/hosts

sudo apt update && sudo apt -y install curl wget net-tools iputils-ping python3-pip sshpass dos2unix

if [[ $(hostname) = "ansible-master" ]]; then
  sudo pip3 install ansible
fi