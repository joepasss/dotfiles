#!/bin/bash

function copy_configs_test {
  local files=$(jq -c ".config_files[]" $JSON)

  for file in $files; do
    local file_name=$(echo $file | jq -r ".file_name")
    local file_location=$(echo $file | jq -r ".file_location" | sed "s|\~|$HOME|")
    local file_dest=$(echo $file | jq -r ".file_dest" | sed "s|\~|$HOME|")

    if [ ! -e $file_location ]; then
      print_error "there is no \"$file_name\" in \"$file_dest\"!"
      print_fail "COPY_CONFIGS"

      exit 1
    fi

    if [ ! -e "$file_dest$file_name" ]; then
      print_error "there is no \"$file_name\" in \"$file_dest\"!"
      print_fail "COPY_CONFIGS"
      
      exit 1
    fi
  done

  print_pass "COPY_CONFIGS"
}
