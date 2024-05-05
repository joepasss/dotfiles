#!/bin/bash

function unmask_packages_test {
  local unmask_dir="/etc/portage/package.accept_keywords"
  local flag=false
  local unmasks=$(jq -c ".unmask_packages[]" "$JSON")
  unmasks=$(echo "$unmasks" | sed 's/ /SP/g')

  for unmask in $unmasks; do
    local name=$(echo $unmask | jq -r ".name")
    local text=$(echo $unmask | jq -r ".text" | sed 's/SP/ /g')

    if [ ! -f "$unmask_dir/$name" ]; then
      print_error "there is no \"$name\" in \"$unmask_dir\"..."
      flag=true
    fi

    if ! cat "$unmask_dir/$name" | grep -q "$text"; then
      print_error "not written \"$text\" in \"$unmask_dir/$name\""
      flag=true
    fi
  done

  if $flag; then
    print_fail "UNMASK_PACKAGES"
    exit 1
  fi

  print_pass "UNMASK_PACKAGES"
}
