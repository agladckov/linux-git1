#!/bin/bash

ansible all -m ping > ansible.log 2>&1
ansible-playbook install.yml >> ansible.log 2>&1
ansible-playbook info.yml >> ansible.log 2>&1
cat ./info/*.txt > send.txt
ansible-playbook --ask-vault-pass send.yml >> ansible.log 2>&1
