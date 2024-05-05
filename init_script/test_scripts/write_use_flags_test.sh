#!/bin/bash

function write_use_flags_test {
  local use_flag_dir="/etc/portage/package.use"
  local flag=false
  local use_flags=$(jq -c ".use_flags[]" "$JSON")
  use_flags=$(echo "$use_flags" | sed 's/ /SP/g')

  for use_flag in $use_flags; do
    local name=$(echo $use_flag | jq -r ".name")
    local text=$(echo $use_flag | jq -r ".text" | sed 's/SP/ /g')

    if [ ! -f "$use_flag_dir/$name" ];then
      print_error "there is no \"$name\" in \"$use_flag_dir/\"..."
      flag=true
    fi

    if ! cat "$use_flag_dir/$name" | grep -q "$text"; then
      print_error "not written \"$text\" in \"$use_flag_dir/$name\""
      flag=true
    fi
  done

  if $flag; then
    print_fail "WRITE_USE_FLAGS"
    exit 1
  fi

  print_pass "WRITE_USE_FLAGS"
}
