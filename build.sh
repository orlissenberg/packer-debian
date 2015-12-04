#!/usr/bin/env bash

CURRENT_DIR=${PWD}
PACKER_BIN=/opt/packer/packer

if [ ! -f $PACKER_BIN ]; then
    echo "Packer binary not found.";
    exit;
fi

mkdir -p ansible/roles 2> /dev/null

cd $CURRENT_DIR

if [ -f "build/debian-iso820-amd64.ovf" ]
then
    echo "Provision"
	$PACKER_BIN build debian-8.2-provision.json
else
    echo "Base"
	$PACKER_BIN build debian-8.2.json
fi

cd $CURRENT_DIR/build

if [ -f "debian-8.2-x86_64.box" ]
then
    vagrant box remove debian-8.2-x86_64 2> /dev/null
    vagrant box add debian-8.2-x86_64 debian-8.2-x86_64.box
fi

