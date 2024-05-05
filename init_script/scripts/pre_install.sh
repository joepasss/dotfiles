#!/bin/bash

function pre_install {
  local emerge=""
  if ! command -v jq $ > /dev/null; then
    emerge="$emerge app-misc/jq"
  fi

  local dependencies=$(jq -r ".dependencies[]" $JSON)

  for dependency in $dependencies; do
    if ! cat /var/lib/portage/world | grep -q "$dependency"; then
      emerge="$emerge $dependency"
    fi
  done
  
  emerge=$(echo "$emerge" | sed 's/^[[:space:]]*//')

  if [ ! -z "$emerge" ]; then
    print_yellow "emerge package\e[39m $emerge"
    sudo emerge -avq $emerge
  fi
}

