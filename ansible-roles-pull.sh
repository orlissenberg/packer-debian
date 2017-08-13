#!/usr/bin/env bash

CURRENT_DIR=`pwd`
ROLES_DIR=${CURRENT_DIR}/ansible/roles

if [ -d ${ROLES_DIR}/ansible-debian-dawn ]; then
    cd ${ROLES_DIR}/ansible-debian-dawn
    git pull
fi

# System
if [ -d ${ROLES_DIR}/ansible-docker ]; then
    cd ${ROLES_DIR}/ansible-docker
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-iptables ]; then
    cd ${ROLES_DIR}/ansible-iptables
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-supervisord  ]; then
    cd ${ROLES_DIR}/ansible-supervisord.git
    git pull
fi

# Languages
if [ -d ${ROLES_DIR}/ansible-go ]; then
    cd ${ROLES_DIR}/ansible-go.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-oracle-java ]; then
    cd ${ROLES_DIR}/ansible-oracle-java.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-php  ]; then
    cd ${ROLES_DIR}/ansible-php.git
    git pull
fi

# Development tools
if [ -d ${ROLES_DIR}/ansible-intellij-idea  ]; then
    cd ${ROLES_DIR}/ansible-intellij-idea.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-oh-my-zsh ]; then
    cd ${ROLES_DIR}/ansible-oh-my-zsh.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-nodejs ]; then
    cd ${ROLES_DIR}/ansible-nodejs.git
    git pull
fi

# Web server
if [ -d ${ROLES_DIR}/ansible-nginx ]; then
    cd ${ROLES_DIR}/ansible-nginx.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-mumble  ]; then
    cd ${ROLES_DIR}/ansible-mumble.git
    git pull
fi

# Database
if [ -d ${ROLES_DIR}/ansible-mariadb  ]; then
    cd ${ROLES_DIR}/ansible-mariadb.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-mysql  ]; then
    cd ${ROLES_DIR}/ansible-mysql.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-db-maintenance  ]; then
    cd ${ROLES_DIR}/ansible-db-maintenance.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-postgresql ]; then
    cd ${ROLES_DIR}/ansible-postgresql.git
    git pull
fi

# Elastic
if [ -d ${ROLES_DIR}/ansible-elasticsearch ]; then
    cd ${ROLES_DIR}/ansible-elasticsearch.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-kibana ]; then
    cd ${ROLES_DIR}/ansible-kibana.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-logstash ]; then
    cd ${ROLES_DIR}/ansible-logstash.git
    git pull
fi

# Various

if [ -d ${ROLES_DIR}/ansible-mumble  ]; then
    cd ${ROLES_DIR}/ansible-mumble.git
    git pull
fi

if [ -d ${ROLES_DIR}/ansible-minecraft  ]; then
    cd ${ROLES_DIR}/ansible-minecraft.git
    git pull
fi
