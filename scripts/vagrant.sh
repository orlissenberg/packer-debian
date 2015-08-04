#!/usr/bin/env bash

# Set up Vagrant.
date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant

groupadd vagrant
useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant

apt-get install -y curl

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd

# Install NFS client
apt-get -y install nfs-common

# Setup sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
echo 'debian ALL=NOPASSWD:ALL' > /etc/sudoers.d/debian
