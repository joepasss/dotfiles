#!/bin/bash

function write_use_flags {
  local use_flag_dir="/etc/portage/package.use"
  local use_flags=$(jq -c ".use_flags[]" "$JSON")
  use_flags=$(echo "$use_flags" | sed 's/ /SP/g')

  for use_flag in $use_flags; do
    local name=$(echo $use_flag | jq -r ".name")
    local text=$(echo $use_flag | jq -r ".text" | sed 's/SP/ /g')

    if [ -f "$use_flag_dir/$name" ]; then
      echo -e "\n"
      print_red "there is already exist \"$name\" in \"$use_flag_dir\"..."
      print_choice "do you want delete \"$use_flag_dir/$name\"?"
      read answer
      
      if [ $answer = "yes" ] || [ $answer = "ye" ] || [ $answer = "y" ]; then
        print_red "remove \"$use_flag_dir/$name\"..."
        sudo rm -rf "$use_flag_dir/$name"

        print_green "CREATE \"$use_flag_dir/$name\"..."
        sudo touch "$use_flag_dir/$name"
        echo "$text" | sudo tee "$use_flag_dir/$name" > /dev/null
      else
        if ! cat "$use_flag_dir/$name" | grep -q "$text"; then
          print_red "\"$use_flag_dir/$name\": $(cat "$use_flag_dir/$name")"
          print_red "expected text: \"$text\""
        fi
      fi
    else
      print_green "CREATE \"$use_flag_dir/$name\"..."
      sudo touch "$use_flag_dir/$name"
      echo "$text" | sudo tee "$use_flag_dir/$name" > /dev/null
    fi
  done
}
