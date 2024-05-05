#!/bin/bash

function unmask_packages {
  local unmask_dir="/etc/portage/package.accept_keywords"
  local unmasks=$(jq -c ".unmask_packages[]" "$JSON")
  unmasks=$(echo "$unmasks" | sed 's/ /SP/g')

  for unmask in $unmasks; do
    local name=$(echo $unmask | jq -r ".name")
    local text=$(echo $unmask | jq -r ".text" | sed 's/SP/ /g')

    if [ -f "$unmask_dir/$name" ]; then
      echo -e "\n"
      print_red "there is already exist \"$name\" in \"$unmask_dir\"..."
      print_choice "do you want delete \"$unmask_dir/$name\"?"
      read answer
      
      if [ $answer = "yes" ] || [ $answer = "ye" ] || [ $answer = "y" ]; then
        print_red "remove \"$unmask_dir/$name\"..."
        sudo rm -rf "$unmask_dir/$name"

        print_green "CREATE \"$unmask_dir/$name\"..."
        sudo touch "$unmask_dir/$name"
        echo "$text" | sudo tee "$unmask_dir/$name" > /dev/null
      else
        if ! cat "$unmask_dir/$name" | grep -q "$text"; then
          print_red "\"$unmask_dir/$name\": $(cat "$unmask_dir/$name")"
          print_red "expected text: \"$text\""
        fi
      fi
    else
      print_green "CREATE \"$unmask_dir/$name\"..."
      sudo touch "$unmask_dir/$name"
      echo "$text" | sudo tee "$unmask_dir/$name" > /dev/null
    fi
  done
}


