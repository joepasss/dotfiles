#!/bin/bash

function emerge_check() {
  local package_name=$1

  if ! qlist -IRv | grep -q "$package_name"; then
    echo "emerge $package_name ..."
    sudo emerge -vq $package_name
  fi
}
