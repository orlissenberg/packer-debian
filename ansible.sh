#!/usr/bin/env bash

CURRENT_DIR=${PWD}
TMP_DIR=/tmp/ansible-test
mkdir -p $TMP_DIR 2> /dev/null

# Create hosts inventory
cat << EOF > $TMP_DIR/hosts
[webservers]
localhost ansible_connection=local
EOF

# Create group_vars for the web servers
mkdir -p $TMP_DIR/group_vars 2> /dev/null
cat << EOF > $TMP_DIR/group_vars/webservers

zsh_users:
  - root
  - debian

nginx_install_method: "package"
nginx_uninstall_apache: true

php_install_composer: true
php_install_laravel: true
php_laravel_user: debian
php_error_reporting: "E_ALL"
php_display_errors: "On"
php_display_startup_errors: "On"

mariadb_root_password: "i_am_root"
mariadb_phpmyadmin_pw: "i_am_admin"
mariadb_phpmyadmin_pw_controluser: "i_am_control"
mariadb_phpmyadmin_install: true
mariadb_percona_install: true

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

idea_install_gnome: true
idea_install_chrome: true
idea_install_sublime: true

postgresql_users:
  - name: testuser
    pass: testpass

postgresql_user_privileges:
  - name: testuser
    role_attr_flags: LOGIN,SUPERUSER

postgresql_listen_addresses:
  - 0.0.0.0

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
#    - service: name=apache2 state=stopped enabled=no #must_exist=false (added in 2.0)
#    - service: name=nginx state=started enabled=yes #must_exist=false (added in 2.0)
#    - service: name=postgresql state=restarted enabled=yes #must_exist=false (added in 2.0)
    - shell: echo 'goodbye'
    - shell: updatedb

  roles:
    - ansible-oracle-java
    - ansible-oh-my-zsh
    - ansible-intellij-idea
    - ansible-php
#    - ansible-nginx
#    - ansible-docker
#    - ansible-mariadb
#    - ansible-postgresql
#    - ansible-go
#    - ansible-elasticsearch
#    - ansible-kibana
#    - ansible-logstash
#    - ansible-nodejs
#    - ansible-iptables
#    - ansible-mumble
#    - ansible-supervisord

# Alternatives
#    - ansible-zendserver
#    - ansible-mysql

EOF

export ANSIBLE_CONFIG=$TMP_DIR/ansible.cfg

# Syntax check
ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts --syntax-check

# First run
ansible-playbook $TMP_DIR/playbook.yml -i $TMP_DIR/hosts

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
