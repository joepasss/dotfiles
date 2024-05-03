#!/bin/bash

function delete_symlink() {
  local dest=$1

  echo -e "\n\e[1m\e[31m$dest is already exist ...\e[0m"
  echo -e "\e[1mWould you like to delete \"$dest\"? \e[33m[\e[32myes\e[33m/\e[31mno\e[33m]\e[0m"
  read answer

  if [ $answer = "yes" ] || [ $answer = "y" ] || [ $answer = "ye" ]; then
    echo "remove $dest ..."
    sudo rm -rf $dest
  else
    echo "exit ..."
    exit 1
  fi
}

function create_symlink_home() {
  local filepath=$1
  local filename=$(basename "$filepath")

  if [ -e $HOME/$filename ]; then
    delete_symlink $HOME/$file
  fi

  echo "create $filename symlink"
  ln -s $filepath $HOME/
}

function create_symlink_config() {
  local filepath=$1
  local filename=$(basename "$filepath")
  
  if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config/
  fi

  if [ -e $HOME/.config/$file ]; then
    delete_symlink $HOME/.config/$filepath
  fi

  echo "create $filename symlink"
  ln -s $filepath $HOME/.config/
}
