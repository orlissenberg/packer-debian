#!/usr/bin/env bash

sudo apt-get update # This will update the repositories list
sudo apt-get upgrade # This will update all the necessary packages on your system
sudo apt-get dist-upgrade # This will add/remove any needed packages

# reboot # You may need this since sometimes after a upgrade/dist-upgrade, there are some left over entries that get fixed after a reboot

apt-get install software-properties-common -y
apt-get install module-assistant -y
# sudo apt-get install linux-headers-"$(uname -r)" # This should work now
