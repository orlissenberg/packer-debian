#!/usr/bin/env bash

CURRENT_DIR=${PWD}
TMP_DIR=/tmp/ansible-test
mkdir -p ${TMP_DIR} 2> /dev/null

# Create hosts inventory
cat << EOF > ${TMP_DIR}/hosts
[webservers]
localhost ansible_connection=local
EOF

# Create group_vars for the web servers
mkdir -p ${TMP_DIR}/group_vars 2> /dev/null
cat << EOF > ${TMP_DIR}/group_vars/webservers

# Oh My Zsh
zsh_users:
  - root
  - debian

# NGINX
nginx_install_method: "package"
nginx_uninstall_apache: true

# PHP
php_install_composer: true
php_install_laravel: true
php_laravel_user: debian
php_error_reporting: "E_ALL"
php_display_errors: "On"
php_display_startup_errors: "On"

# MariaDB
mariadb_root_password: "i_am_root"
mariadb_phpmyadmin_pw: "i_am_admin"
mariadb_phpmyadmin_pw_controluser: "i_am_control"
mariadb_phpmyadmin_install: true
mariadb_percona_install: true

# Postgresql
postgresql_default_auth_method: "md5"

postgresql_pg_hba_default:
  - type: local
    database: all
    user: '{{ postgresql_admin_user }}'
    address: ''
    method: 'peer'
    comment: ''
  - type: local
    database: all
    user: all
    address: ''
    method: '{{ postgresql_default_auth_method }}'
    comment: '"local" is for Unix domain socket connections only'
  - type: host
    database: all
    user: all
    address: '192.168.0.0/16'
    method: '{{ postgresql_default_auth_method }}'
    comment: 'IPv4 local connections:'
  - type: host
    database: all
    user: all
    address: '::1/128'
    method: '{{ postgresql_default_auth_method }}'
    comment: 'IPv6 local connections:'

postgresql_users:
  - name: testuser
    pass: testpass

postgresql_user_privileges:
  - name: testuser
    role_attr_flags: LOGIN,SUPERUSER

postgresql_listen_addresses:
  - 0.0.0.0

# IDEA
idea_install_gnome: true
idea_install_chrome: true
idea_install_sublime: true
idea_install_gitkraken: true

# Mumble
mumble_admin_password: "test-admin"
mumble_db_path: /var/lib/mumble-server/mumble-server.sqlite
mumble_log_path: /var/log/mumble-server/mumble-server.log
mumble_port: 64746
mumble_server_password: "test"
mumble_max_bandwidth: 72000
mumble_max_users: 10
mumble_user_name: "mumble-server"
mumble_welcome_text: "<br />Welcome to this server running <b>Murmur</b>.<br />"
mumble_reset: true
mumble_revoke_self_register: true

mumble_channels:
    - name: "Ingress"
      id: 10
      parent_id: 0
      server_id: 1
    - name: "The Lounge"
      id: 12
      parent_id: 0
      server_id: 1
    - name: "Enlightened"
      id: 14
      parent_id: 10
      server_id: 1

# NodeJS

nodejs_install_gulp: true
nodejs_install_grunt: true
nodejs_install_coffee_script: true

EOF

# Create Ansible config
cat << EOF > ${TMP_DIR}/ansible.cfg
[defaults]
roles_path = ${CURRENT_DIR}/ansible/roles
host_key_checking = False
EOF

# Create playbook.yml
cat << EOF > ${TMP_DIR}/playbook.yml
---

- hosts: webservers
  gather_facts: yes
  become: true
  become_method: sudo

  pre_tasks:
    - shell: echo 'hello'

  tasks:
    - shell: echo 'busy'

  post_tasks:
#    - service: name=apache2 state=stopped enabled=no #must_exist=false (added in 2.0)
#    - service: name=nginx state=started enabled=yes #must_exist=false (added in 2.0)
#    - service: name=postgresql state=restarted enabled=yes #must_exist=false (added in 2.0)
    - shell: echo 'goodbye'
    - shell: updatedb

  roles:
#    - ansible-docker
#    - ansible-elasticsearch
    - ansible-go
#    - ansible-intellij-idea
#    - ansible-iptables
#    - ansible-kibana
#    - ansible-logstash
#    - ansible-mariadb
#    - ansible-mumble
#    - ansible-nginx
#    - ansible-nodejs
#    - ansible-oh-my-zsh
#    - ansible-oracle-java
#    - ansible-php
#    - ansible-postgresql
#    - ansible-supervisord

# Alternatives
#    - ansible-mysql

EOF

export ANSIBLE_CONFIG=${TMP_DIR}/ansible.cfg

# Syntax check
ansible-playbook ${TMP_DIR}/playbook.yml -i ${TMP_DIR}/hosts --syntax-check

# First run
ansible-playbook ${TMP_DIR}/playbook.yml -i ${TMP_DIR}/hosts

# web
# http://192.168.33.102/
# service nginx status

# mariadb - phpmyadmin
# https://192.168.33.102:444

# elasticsearch
# http://192.168.33.102:9200/
# http://192.168.33.102:9200/_plugin/head
# service elasticsearc status

# sudo /usr/local/kibana/bin/kibana
# http://192.168.33.102:5601
