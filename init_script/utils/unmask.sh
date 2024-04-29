#!/bin/bash

function unmask_package() {
  local name=$1
  local unmask_string=$2

  local unmask_dir="/etc/portage/package.accept_keywords"

  if [ ! -d $unmask_dir ]; then
    sudo mkdir -p /etc/portage/package.accept_keywords
  fi

  if [ ! -f $unmask_dir/$name ]; then
    echo "unmask $name ..."
    
    sudo touch $unmask_dir/$name
    echo "$unmask_string" | sudo tee -a $unmask_dir/$name
  fi
}
