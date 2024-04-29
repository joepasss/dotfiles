#!/bin/bash

function delete_symlink() {
  local dest=$1
  local type=$2
  local filename=$(basename "$dest")

  echo "remove $filename"
  
  if [ "$type" = "home" ]; then
    rm -rf $HOME/$filename
  fi

  if [ ! "$type" = "home" ]; then
    rm -rf $HOME/.config/$filename
  fi
}

function create_symlink_home() {
  local file=$1
  local filename=$(basename "$file")

  delete_symlink $HOME/$file home

  echo "create $filename symlink"
  ln -s $file $HOME/
}

function create_symlink_config() {
  local file=$1
  local filename=$(basename "$file")
  
  if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config/
  fi

  delete_symlink $HOME/.config/$file config

  echo "create $filename symlink"
  ln -s $file $HOME/.config/
}
