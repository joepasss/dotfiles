#!/bin/bash

function overlay_add() {
  local name=$1
  local type=$2
  local url=$3

  if [ ! -f $ESELECT_REPO ]; then
    sudo mkdir -p /etc/portage/repos.conf
  fi

  if ! grep -q "$name" "$ESELECT_REPO"; then
    echo "$name overlay add ..."

    if ! eselect repository list | grep -q "$name"; then
      sudo eselect repository add $name $type $url
    fi

    sudo eselect repository enable $name

    echo "$name overlay sync ..."
    sudo emaint sync -r $name
  fi
}
