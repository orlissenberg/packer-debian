#!/usr/bin/env bash

# remark: https://github.com/angstwad/docker.ubuntu/issues/43
# apt-add-repository ppa:ansible/ansible

apt-get install -y python-dev python-apt python-pycurl python-pip python-virtualenv
pip install paramiko PyYAML Jinja2 httplib2
pip install ansible
pip install passlib