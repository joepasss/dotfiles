#!/bin/bash

function print_error() {
	local msg=$1

	printf "\e[1m\e[31mERROR!\e[39m %s\e[0m\n" "$msg"
}

function print_choice() {
	local msg=$1

	printf "\e[1m$msg \e[33m[\e[32myes\e[33m/\e[31mno\e[33m]\e[39m: \e[0m" "$msg"
}

function print_red() {
	local msg=$1

	printf "\e[1m\e[31m* %s\e[0m\n" "$msg"
}

function print_yellow() {
	local msg=$1

	printf "\e[1m\e[33m* %s\e[0m\n" "$msg"
}

function print_green() {
	local msg=$1

	printf "\e[1m\e[32m* %s\e[0m\n" "$msg"
}

# for test msg
function print_pass() {
	local msg=$1

	printf "\e[1m\e[32m* %s TEST PASSED \xE2\x9C\x94\e[0m\n" "$msg"
}

function print_fail() {
	local msg=$1

	printf "\e[1m\e[31m* %s TEST FAILED \xE2\x9D\x8C\e[0m\n" "$msg"
}
