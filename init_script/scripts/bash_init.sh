#!/bin/bash

function bash_init() {
	print_green "bash init ..."
	printf "\n"

	print_yellow "gitstatus check ..."

	if [ ! -e $HOME/gitstatus ]; then
		print_yellow "gitstatus clone ..."

		git clone --depth=1 https://github.com/romkatv/gitstatus.git $HOME/gitstatus
		print_green "gitstatus clone done!"
	else
		print_green "gitstatus exist!"
	fi

	print_yellow "create .bashrc symlink ..."

	if [ -e $HOME/.bashrc ]; then
		rm -rf $HOME/.bashrc
	fi

	create_symlink ".bashrc" "$DOTFILE_DIR/bash/.bashrc" "$HOME"
	printf "\n"
}
