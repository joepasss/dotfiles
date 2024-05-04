#!/bin/bash

function copy_configs_test {
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

  echo -e "\e[1mcopy_configs function test\e[0m"

  for index in ${!files[*]}; do
    local file_path=${files[$index]}
    local file_name=$(basename $file_path)
    local file_dest=${destinations[$index]}

    if [ ! -e $file_dest/$file_name ]; then
      echo -e "copy_configs failed... index: $index"
      exit 1
    fi
  done
  
  echo -e "\e[1mpassed\e[0m"
}

function unmask_packages_test {
  local package_names=(\
    "lazygit"\
    "tofi"\
    "nerd-fonts"\
    "obsidian"\
  )

  package_unmasks=(\
    "dev-vcs/lazygit ~amd64"\
    "gui-apps/tofi ~amd64"\
    "media-fonts/nerd-fonts ~amd64 ~x86"\
    "app-office/obsidian ~amd64 ~arm64"\
  )

  echo -e "\e[1munmask_packages test\e[0m"

  for index in ${!package_names[*]}; do
    local dest="/etc/portage/package.accept_keywords/${package_names[index]}"

    if [ ! -e $dest ]; then
      echo -e "unmask_pacakges test failed ... index: $index"
      exit 1
    fi
  done

  echo -e "\e[1mpassed\e[0m"
}

function write_use_flags_test {
  local package_names=(\
    "waybar"\
    "nerd-fonts"\
    "obsidian"\
  )

  local package_use_flags=(\
    "gui-apps/waybar logind network pipewire popups udev wifi"\
    "media-fonts/nerd-fonts d2coding firacode firamono hack jetbrainmono"\
    "app-office/obsidian l10n_ko"\
  )

  for index in ${!package_names[*]}; do
    local dest="/etc/portage/package.use/${package_names[$index]}"

    if [ ! -e $dest ]; then
      echo -e "write_use_flags test failed ... index: $index"
      exit 1
    fi
  done

  echo -e "\e[1mpassed\e[0m"
}



function test() {
  local test_arg=$1
 
  copy_configs
  copy_configs_test

  sudo -v
  unmask_packages
  unmask_packages_test

  write_use_flags
  write_use_flags_test

  sync_overlays
  sync_overlays_test
  
  install_packages
  install_packages_test
  sudo -k
}
