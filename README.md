# packer-debian

Packer Build VirtualBox-Iso Debian with Ansible Provisioner

## Debian Jessie

http://cdimage.debian.org/debian-cd/8.2.0/amd64/iso-cd/

### Notes

Linux version

    lsb_release -a

    less /etc/debian_release

[Handling LF and CRLF Line Endings](https://www.jetbrains.com/idea/help/handling-lf-and-crlf-line-endings.html)

On Windows:

    git config --global core.autocrlf true
    
Dump all the host anssible variables to file:

    sudo ansible -m setup localhost -i hosts > /vagrant/ansible_vars_dump.json
