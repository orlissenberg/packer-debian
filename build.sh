#!/usr/bin/env bash

CURRENT_DIR=${PWD}
PACKER_BIN=`which 'packer'`

if [ ! -f $PACKER_BIN ]; then
    echo "Packer binary not found.";
    exit;
fi

mkdir -p ansible/roles 2> /dev/null

cd $CURRENT_DIR

if [ -f "build/debian-iso-amd64.ovf" ]
then
    echo "Provision"
    $PACKER_BIN build -var-file=variables.json debian-provision.json
else
    echo "Base"
    # Note: if the script fails, run it manually on the console ...
    # packer build -var-file=variables.json debian.json
    $PACKER_BIN build -var-file=variables.json debian.json
fi

cd $CURRENT_DIR/build

if [ -f "debian-x86_64.box" ]
then
    vagrant box remove debian-x86_64 2> /dev/null
    vagrant box add debian-x86_64 debian-x86_64.box
fi

