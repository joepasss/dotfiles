#!/bin/bash

function write_use() {
  local package_name=$1
  local use=$2

  local use_dir="/etc/portage/package.use/$package_name"

  if [ ! -d /etc/portage/package.use ]; then
    sudo make -p /etc/portage/package.use
  fi

  if [ -f $use_dir ]; then
    echo -e "\n\e[1m\e[31m/package.use/$package_name is already exist ...\e[0m"
    echo -e "\e[1m$package_name use: \"$(cat /etc/portage/package.use/$package_name)\"\e[0m\n"
    echo -e "\e[1mWould you like to delete \"package.use/$package_name\"? \e[33m[\e[32myes\e[33m/\e[31mno\e[33m]\e[0m"
    read answer

    if [ $answer = "yes" ] || [ $answer = "y" ] || [ $answer = "ye" ]; then
      echo "remove $package_name local use flag file ..."
      sudo rm -rf $use_dir
    else
      echo "exit ..."
      exit 1
    fi
  fi

 sudo touch $use_dir
 echo "$use" | sudo tee -a $use_dir > /dev/null
}
