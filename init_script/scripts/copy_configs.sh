#!/bin/bash

function copy_configs {  
  echo -e "\e[1mcopy config files ...\e[0m"
  
  local files=$(jq -c ".config_files[]" $JSON)

  for file in $files; do
    local file_name=$(echo $file | jq -r ".file_name")
    local file_location=$(echo $file | jq -r ".file_location" | sed "s|\~|$HOME|")
    local file_dest=$(echo $file | jq -r ".file_dest" | sed "s|\~|$HOME|")
  
    if [ -e "$file_dest$file_name" ] && [ ! $(readlink $file_dest$file_name) = "" ]; then
      print_red "symlink exsist! \e[39m: $file_dest$file_name"
      print_choice "Do you want create new symlink?"
      read answer

      if [ $answer = "yes" ] || [ $answer = "ye" ] || [ $answer = "y" ]; then
        print_red "REMOVE $file_dest$file_name ..."
        rm -rf $file_dest$file_name

        print_green "CREATE $file_dest$file_name symlink ..."
        ln -s $file_location $file_dest
      fi
    else
      print_green "CREATE $file_dest$file_name symlink ..."
      ln -s $file_location $file_dest
    fi
  done
}
