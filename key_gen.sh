#!/usr/bin/env bash

ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

for val in ansible-master ansible-node1 ansible-node2; do 
	echo "-------------------- COPYING KEY TO ${val^^} ------------------------------"
	sshpass -p 'vagrant' ssh-copy-id -o "StrictHostKeyChecking=no" vagrant@$val 
done


PROJECT_DIRECTORY="/home/vagrant/ansible_project/"
mkdir -p $PROJECT_DIRECTORY
cd $PROJECT_DIRECTORY

echo -e "ansible-master\n\n[nodes]\nansible-node1\nansible-node2" > inventory
echo -e "[defaults]\ninventory = inventory" > ansible.cfg
echo -e "-------------------- RUNNING ANSBILE ADHOC COMMAND - UPTIME ------------------------------"
echo


ansible all -i inventory -m "shell" -a "uptime"
echo

