#!/bin/bash

function install_packages {
  local emerge=""
  local emerge_packages=$(jq -c ".packages | .emerge[]" $JSON | sed 's/"//g')
  local build_packages=$(jq -c ".packages | .build[]" $JSON | sed 's/ /SP/g')
  local bin_dir="/usr/bin"

  for build_package in $build_packages; do
    local name=$(echo $build_package | jq -r ".name")
    local type=$(echo $build_package | jq -r ".type")

    if [ $type == "git_clone" ]; then
      local git_repo=$(echo $build_package | jq -r ".git_repo")
      local clone_dir=$(echo $build_package | jq -r ".clone_dir")
      clone_dir=$(echo $clone_dir | sed "s|\~|$HOME|")

      if [ ! -e $clone_dir ]; then
        print_green "git clone \"$name\" in \"$clone_dir\"..."
        git clone $git_repo $clone_dir
      fi
    fi

    if [ $type == "build" ]; then
      local build_type=$(echo $build_package | jq -r ".build_type")

      if [ $build_type == "go" ]; then
        local params=$(echo $build_package | jq -r ".params")
        params=$(echo $params | sed 's/SP/ /g')

        if ! command -v go; then
          print_error "no \"go\" command ..."
          exit 1
        fi

        go $params
      fi

      if [ $build_type == "cargo" ]; then
        local git_repo=$(echo $build_package | jq -r ".git_repo")
        local params=$(echo $build_package | jq -r ".params")
        params=$(echo $params | sed 's/SP/ /g')

        if ! command -v cargo; then
          print_error "no \"cargo\" command ..."
          exit 1
        fi

        print_green "clone \"$name\" to \"$SCRIPT_DIR/tmp\" dir..."
        mkdir "$SCRIPT_DIR/tmp"
        git clone $git_repo "$SCRIPT_DIR/tmp"

        cd "$SCRIPT_DIR/tmp"
        cargo $params
      fi

      local bin_path=$(echo $build_package | jq -r ".bin_path")
      bin_path=$(echo $bin_path | sed 's/[][]//g; s/"//g; s/,/ /g')
      bin_path=$(echo $bin_path | sed "s|\~|$HOME|g")
      bin_path=$(echo $bin_path | sed "s|./tmp|$SCRIPT_DIR/tmp|g")

      for path in $bin_path; do
        if [ ! -e $path ]; then
          print_error "there is no \"$path\" binary file..."
          exit 1
        fi
        
        sudo mv $path "$bin_dir/"
      done
    fi
  done

  if [ -e "$SCRIPT_DIR/tmp" ]; then
    print_yellow "remove \"$SCRIPT_DIR/tmp\" dir..."
    cd $SCRIPT_DIR
    rm -rf "$SCRIPT_DIR/tmp"
  fi

  
  for emerge_package in $emerge_packages; do
    if ! qlist -IRv | grep -q "$emerge_package"; then
      emerge="$emerge $emerge_package"
    fi
  done

  emerge=$(echo "$emerge" | sed 's/^[[:space:]]*//')

  if [ ! -z "$emerge" ]; then
    print_yellow "emerge package\e[39m $emerge"
    sudo emerge -avq $emerge
  fi
}
