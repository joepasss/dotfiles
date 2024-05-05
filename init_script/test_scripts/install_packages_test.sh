#!/bin/bash

function install_packages_test {
  local flag=false

  local emerge_packages=$(jq -c ".packages | .emerge[]" $JSON | sed 's/"//g')
  local build_packages=$(jq -c ".packages | .build[]" $JSON | sed 's/ //g')
  local bin_dir="/usr/bin"
 
  for emerge_package in $emerge_packages; do
    if ! qlist -IRv | grep -q "$emerge_package"; then
      print_error "there is no \"$emerge_package\" package!"
      flag=true
    fi
  done

  for build_package in $build_packages; do
    local name=$(echo $build_package | jq -r ".name")
    local type=$(echo $build_package | jq -r ".type")
    
    if [ $type == "git_clone" ]; then
      local clone_dir=$(echo $build_package | jq -r ".clone_dir")
      clone_dir=$(echo $clone_dir | sed "s|\~|$HOME|")

      if [ ! -e "$clone_dir" ]; then
        print_error "there is no \"$clone_dir\" directory for \"$name\"..."
        flag=true
      fi
    fi

    if [ $type == "build" ]; then
      local bin_path=$(echo $build_package | jq -r ".bin_path")
      bin_path=$(echo $bin_path | sed 's/[][]//g; s/"//g; s/,/ /g;')
      
      for path in $bin_path; do
        local file_name=$(echo $path | sed "s|.*/||g")
      
        if [ ! -e "$bin_dir/$file_name" ]; then
          print_error "there is no \"$file_name\" in \"$bin_dir\""
          flag=true
        fi
      done
    fi
  done

  if $flag; then
    print_fail "INSTALL_PACKAGES"
    exit 1
  fi

  print_pass "INSTALL_PACKAGES"
}
