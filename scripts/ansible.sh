#!/usr/bin/env bash

apt-get install software-properties-common -y
apt-get install sshpass -y
apt-get update

apt-get install -y build-essential libssl-dev libffi-dev
apt-get install -y python-dev python-apt python-pycurl
apt-get install -y python-pip python-virtualenv python-setuptools

pip install --upgrade cffi
pip install paramiko PyYAML Jinja2 httplib2 six
pip install markupsafe
pip install ansible
pip install passlib
