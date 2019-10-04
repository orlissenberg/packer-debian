#!/usr/bin/env bash

rm -Rf build
rm -Rf output-virtualbox-iso

if [ $# -eq 1 ]
  then
    if [ "$1" = "cache" ]
    then
      rm -Rf packer_cache
    fi

    if [ "$1" = "all" ]
    then
      rm -Rf ansible
    fi

    if [ "$1" = "box" ]
    then
      vagrant box remove debian-x86_64 2> /dev/null
    fi
fi
