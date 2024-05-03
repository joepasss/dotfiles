#!/bin/bash

function delete_symlink() {
  local dest=$1

  rm -rf $dest
}

function create_symlink_home() {
  local filepath=$1
  local filename=$(basename "$filepath")

  if [ -e $HOME/$filename ]; then
    delete_symlink $HOME/$file
  fi

  echo "create $filename symlink"
  ln -s $file $HOME/
}

function create_symlink_config() {
  local file=$1
  local filename=$(basename "$file")
  
  if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config/
  fi

  if [ -e $HOME/.config/$file ]; then
    delete_symlink $HOME/.config/$file
  fi

  echo "create $filename symlink"
  ln -s $file $HOME/.config/
}
