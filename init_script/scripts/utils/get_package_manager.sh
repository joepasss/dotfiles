#!/bin/bash

function get_package_manager() {
	if command -v brew >/dev/null; then
		echo "brew"
	elif command -v emerge >/dev/null; then
		echo "emerge"
	else
		echo "UNKNOWN"
	fi
}
