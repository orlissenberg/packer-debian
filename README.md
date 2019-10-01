# packer-debian

Packer Build VirtualBox-Iso Debian with Ansible Provisioner

## Packer Notes

[Ansible Local Reference](https://www.packer.io/docs/provisioners/ansible-local.html)

Packer verbose output Ansible Local

    {
        "type": "ansible-local",
        "playbook_file": "playbook.yml",
        "extra_arguments": [
            "-v"
        ]
    }

## Debian Jessie

[Debian Versions](https://en.wikipedia.org/wiki/Debian_version_history)
https://cdimage.debian.org/mirror/cdimage/archive/9.4.0/amd64/iso-cd/

    "iso_url": "https://cdimage.debian.org/mirror/cdimage/archive/{{user `version`}}/amd64/iso-cd/debian-{{user `version`}}-amd64-netinst.iso",
    or download and make it
    "iso_url": "debian-{{user `version`}}-amd64-netinst.iso",

### Vagrant Guest Additions 

    vagrant plugin install vagrant-vbguest

### Notes

Linux version

    lsb_release -a

    less /etc/debian_release

[Handling LF and CRLF Line Endings](https://www.jetbrains.com/idea/help/handling-lf-and-crlf-line-endings.html)

On Windows:

    git config --global core.autocrlf true
    
Dump all the host ansible variables to file:

    sudo ansible -m setup localhost -i hosts > /vagrant/ansible_vars_dump.json

Change shell for other user:

    sudo chsh -s /bin/zsh orlissenberg

Kimsufi notice

    https://docs.ovh.com/gb/en/dedicated/install-rtm/#automatically-install-rtm-on-linux_2
    
