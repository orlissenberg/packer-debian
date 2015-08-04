#!/usr/bin/env bash

apt-get install git vim -y

if [ ! -d ./ansible/roles ]; then
    echo 'Ansible roles folder not found.';
    exit;
fi

cd ansible
cd roles

if [ ! -d ./ansible-docker ]; then
    git clone https://github.com/orlissenberg/ansible-docker.git
fi

if [ ! -d ./ansible-oh-my-zsh ]; then
    git clone https://github.com/orlissenberg/ansible-oh-my-zsh.git
fi

if [ ! -d ./ansible-oracle-java ]; then
    git clone https://github.com/orlissenberg/ansible-oracle-java.git
fi

if [ ! -d ./ansible-iptables ]; then
    git clone https://github.com/orlissenberg/ansible-iptables.git
fi

if [ ! -d ./ansible-debian-dawn ]; then
    git clone https://github.com/orlissenberg/ansible-debian-dawn.git
fi

if [ ! -d ./ansible-elasticsearch ]; then
    git clone https://github.com/orlissenberg/ansible-elasticsearch.git
fi

if [ ! -d ./ansible-kibana ]; then
    git clone https://github.com/orlissenberg/ansible-kibana.git
fi

if [ ! -d ./ansible-go ]; then
    git clone https://github.com/orlissenberg/ansible-go.git
fi

# forked

if [ ! -d ./ansible-nginx ]; then
    git clone https://github.com/orlissenberg/ansible-nginx.git
fi

if [ ! -d ./ansible-postgresql ]; then
    git clone https://github.com/orlissenberg/ansible-postgresql.git
fi

if [ ! -d ./ansible-supervisord  ]; then
    git clone https://github.com/orlissenberg/ansible-supervisord.git
fi

if [ ! -d ./ansible-php  ]; then
    git clone https://github.com/orlissenberg/ansible-php.git
fi