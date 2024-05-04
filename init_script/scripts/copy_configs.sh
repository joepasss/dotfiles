#!/bin/bash

function copy_configs {  
  local files=(\
    "$DOTFILE_DIR/bash/.bashrc"\
    "$DOTFILE_DIR/tmux/.tmux.conf"\
    "$DOTFILE_DIR/gitmux/.gitmux.conf"\
    "$DOTFILE_DIR/kitty/"\
    "$DOTFILE_DIR/dunst/"\
    "$DOTFILE_DIR/nvim/"\
    "$DOTFILE_DIR/tofi/"\
    "$DOTFILE_DIR/waybar/"\
    "$DOTFILE_DIR/kime"\
  )

  local destinations=(\
    "$HOME/"\
    "$HOME/"\
    "$HOME/"\
    "$HOME/.config"\
    "$HOME/.config"\
    "$HOME/.config"\
    "$HOME/.config"\
    "$HOME/.config"\
    "$HOME/.config"\
  )

  echo -e "\e[1mcopy config files ...\e[0m"
  
  for index in ${!files[*]}; do
    local file_path=${files[$index]}
    local file_name=$(basename $file_path)
    local file_dest=${destinations[$index]}

    if [ -e $file_dest/$file_name ]; then
      rm -rf $file_dest/$file_name
    fi

    ln -s $file_path $file_dest
  done
}
