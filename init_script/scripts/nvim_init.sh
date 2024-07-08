#!/bin/bash

function nvim_init() {
	local package_manager=$1

	print_green "nvim init ..."
	printf "\n"

	if ! command -v nvim >/dev/null; then
		print_yellow "nvim install ..."

		case "$package_manager" in
		brew)
			brew install neovim
			;;
		emerge)
			emerge -avq app-editors/neovim
			;;
		*)
			print_error "please install \"neovim\" package ..."
			exit 1
			;;
		esac

		print_green "nvim install done!"
	fi

	create_symlink "nvim" "$DOTFILE_DIR/nvim/" "$HOME/.config/"
	printf "\n"
}
