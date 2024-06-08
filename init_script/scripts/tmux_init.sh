#!/bin/bash

function go_install() {
	local package_manager=$1

	print_yellow "go install ..."

	case "$package_manager" in
	brew)
		brew install go
		;;
	emerge)
		sudo emerge -avq dev-lang/go
		;;
	*)
		print_error "please install \"golang\" package ..."
		exit 1
		;;
	esac
}

function gitmux_init() {
	local package_manager=$1

	print_yellow "gitmux check ..."

	if ! command -v gitmux >/dev/null; then
		print_yellow "gitmux install ..."

		case "$package_manager" in
		brew)
			brew tab arl/arl
			brew install gitmux
			;;
		*)
			if ! command -v go >/dev/null; then
				go_install $package_manager
			fi

			go install github.com/arl/gitmux@latest
			;;
		esac

		print_green "gitmux install done!"
	fi
}

function tpm_init() {
	print_yellow "tpm check ..."
	if [ ! -e $HOME/.tmux/plugins/tpm ]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

		print_green "tpm clone done!"
	fi
}

function tmux_init() {
	local package_manager=$1

	print_green "tmux_init ..."
	printf "\n"

	gitmux_init $package_manager
	tpm_init $package_manager

	print_yellow "tmux check ..."

	if ! command -v tmux >/dev/null; then
		print_yellow "tmux install ..."

		local package_manager=$(get_package_manager)

		case "$package_manager" in
		brew)
			brew install tmux
			;;
		emerge)
			sudo emerge -avq app-misc/tmux
			;;
		*)
			print_error "Unkown package manager \"$package_manager\" ..."
			;;
		esac

		print_green "tmux install done!"
	fi

	create_symlink ".gitmux.conf" "$DOTFILE_DIR/gitmux/.gitmux.conf" "$HOME"
	create_symlink ".tmux.conf" "$DOTFILE_DIR/tmux/.tmux.conf" "$HOME"
	printf "\n"
}
