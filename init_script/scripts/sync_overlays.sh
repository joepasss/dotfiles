#!/bin/bash

function sync_overlays {
  local overlays=$(jq -c ".overlays[]" $JSON)
  
  if ! command -v emaint $ > /dev/null; then
    print_error "there is no \"emaint\" program!"
    print_choice "do you want emerge \"app-portage/gentoolkit\" package?"
    read answer

    if [ $answer = "yes" ] || [ $answer = "ye" ] || [ $answer = "y" ]; then
      print_green "emerge \"app-portage/gentoolkit\" package ..."
      sudo emerge -vq app-portage/gentoolkit
    else
      print_error "can't execute \"sync_overlays\" without emaint program ..."
      print_red "exit program"
      exit 1
    fi
  fi

  if ! command -v eselect repository $ > /dev/null; then
    print_error "there is no \"eselect repository\" program!"
    print_choice "do you want emerge \"app-eselect/eselect-repository\" package?"
    read answer

    if [ $answer = "yes" ] || [ $answer = "ye" ] || [ $answer = "y" ]; then
      print_green "emerge \"app-eselect/eselect-repository\" package ..."
      sudo emerge -vq app-eselect/eselect-repository
    else
      print_error "can't execute \"sync_overlay\" without eselect repository program ..."
      print_red "exit program"
      exit 1
    fi
  fi

  if [ ! -d $(dirname $ESELECT_REPO) ]; then
    print_yellow "there is no $(dirname $ESELECT_REPO) directory ..."
    print_green "create $(dirname $ESELECT_REPO)"
    sudo mkdir -p $(dirname $ESELECT_REPO)
  fi

  for overlay in $overlays; do
    local overlay_name=$(echo $overlay | jq -r ".name")
    local overlay_type=$(echo $overlay | jq -r ".type")
    local overlay_url=$(echo $overlay | jq -r ".url")
  
    if ! grep -q "\[$overlay_name\]" "$ESELECT_REPO" || [ ! -f $ESELECT_REPO ]; then
      if ! eselect repository list | grep -q $overlay_name; then
        print_yellow "add \"$overlay_name\" repository..."
        sudo eselect repository add $overlay_name $overlay_type $overlay_url
      fi

      print_yellow "enable \"$overlay_name\" repository..."
      sudo eselect repository enable $overlay_name

      print_yellow "sync \"$overlay_name\"..."
      sudo emaint sync -r $overlay_name
    fi
  done
}

