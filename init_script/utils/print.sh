#!/bin/bash

function print_error() {
  local msg=$1
  
  echo -e "\e[1m\e[31mERROR!\e[39m $msg\e[0m"
}

function print_choice() {
  local msg=$1

  echo -e "\e[1m$msg \e[33m[\e[32myes\e[33m/\e[31mno\e[33m]\e[39m: \e[0m"
}

function print_red() {
  local msg=$1

  echo -e "\e[1m\e[31m* $msg\e[0m"
}

function print_yellow() {
  local msg=$1

  echo -e "\e[1m\e[33m* $msg\e[0m"
}

function print_green() {
  local msg=$1

  echo -e "\e[1m\e[32m* $msg\e[0m"
}

# for test msg
function print_pass() {
  local msg=$1

  echo -e "\e[1m\e[32m* $msg TEST PASSED \xE2\x9C\x94\e[0m"
}

function print_fail() {
  local msg=$1

  echo -e "\e[1m\e[31m* $msg TEST FAILED \xE2\x9D\x8C\e[0m"
}
