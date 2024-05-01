#!/bin/bash

if [ -d ~/.venv/ansible_copy_from_github ]; then
  source ~/.venv/ansible_copy_from_github/bin/activate
else
  echo "Virtual Environment Not Found, creating it ..."
  python3 -m venv ~/.venv/ansible_copy_from_github
  source ~/.venv/ansible_copy_from_github/bin/activate
fi

# Calling the play
ansible-playbook main.yml
