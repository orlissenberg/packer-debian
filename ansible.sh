#!/usr/bin/env bash

CURRENT_DIR=${PWD}
TMP_DIR=/tmp/ansible-test
mkdir -p $TMP_DIR 2> /dev/null

# Create hosts inventory
cat << EOF > $TMP_DIR/hosts
[webservers]
localhost ansible_connection=local
EOF

# Create group_vars for the webservers
mkdir -p $TMP_DIR/group_vars 2> /dev/null
cat << EOF > $TMP_DIR/group_vars/webservers

zsh_users:
  - root
  - debian

nginx_install_method: "package"

php_install_composer: true
php_install_laravel: true
php_laravel_user: debian
php_error_reporting: "E_ALL"
php_display_errors: "On"
php_display_startup_errors: "On"

EOF

# Create Ansible config
cat << EOF > $TMP_DIR/ansible.cfg
[defaults]
roles_path = $CURRENT_DIR/ansible/roles
host_key_checking = False
EOF

# Create playbook.yml
cat << EOF > $TMP_DIR/playbook.yml
---

- hosts: webservers
  gather_facts: yes
  sudo: yes

  pre_tasks:
    - shell: echo 'hello'

  tasks:
    - shell: echo 'busy'

  post_tasks:
    - service: name=apache2 state=stopped enabled=no #must_exist=false (added in 2.0)
    - service: name=nginx state=started enabled=yes #must_exist=false (added in 2.0)
    - shell: echo 'goodbye'
    - shell: updatedb

  roles:
    - ansible-oh-my-zsh
    - ansible-oracle-java
    - ansible-elasticsearch
    - ansible-nginx
    - ansible-php
    - ansible-postgresql
    - ansible-go
    - ansible-kibana
    - ansible-mysql

EOF

export ANSIBLE_CONFIG=$TMP_DIR/ansible.cfg

# Syntax check
ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts --syntax-check

# First run
ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts

# web
# http://192.168.33.102/

# elasticsearch
# http://192.168.33.102:9200/
# http://192.168.33.102:9200/_plugin/head

# sudo /usr/local/kibana/bin/kibana
# http://192.168.33.102:5601
