#!/bin/bash

function pre_install_test {
  local flag=false

  if ! command -v jq $ > /dev/null; then
    print_error "there is no \"app-misc/jq\" package!"
    flag=true
  fi

  if ! command -v go $ > /dev/null; then
    print_error "there is no \"dev-lang/go\" package!"
    flag=true
  fi

  if ! command -v qlist $ > /dev/null; then
    print_error "there is no \"app-portage/gentoolkit\" package!"
    flag=true
  fi

  if ! command -v eselect repository $ > /dev/null; then
    print_error "there is no \"app-eselect/eselect-repository\" package!"
    flag=true
  fi

  if ! qlist -IRv | grep -q "app-arch/lz4"; then
    print_error "there is no \"app-arch/lz4\" package!"
    flag=true
  fi
  
  if $flag; then
    print_fail "PRE_INSTALL"
    exit 1
  fi

  print_pass "PRE_INSTALL"
}
