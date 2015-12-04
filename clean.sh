#!/usr/bin/env bash

rm -Rf ansible
rm -Rf build
rm -Rf output-virtualbox-iso

if [ $# -eq 1 ]
  then
    if [ "$1" = "all" ]
    then
      rm -Rf packer_cache
    fi
fi
