#!/bin/bash

function gitstatus_install {
  if [ ! -f $HOME/gitstatus ]; then
    git clone --depth=1 https://github.com/romkatv/gitstatus.git $HOME/gitstatus
  fi
}

function tpm_install {
  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi
}

function gitmux_install {
  emerge_check "dev-lang/go"

  if [ ! -f $HOME/go/bin/gitmux ]; then
    if [ ! -f /usr/bin/gitmux ]; then
      go install github.com/arl/gitmux@latest
      sudo mv $HOME/go/bin/gitmux /usr/bin
    fi
  fi
}

function swww_install {
  emerge_check "app-arch/lz4"

  if [ ! -f /usr/bin/swww ] && [ ! -f /usr/bin/swww-daemon ]; then
    git clone https://github.com/LGFae/swww.git $SCRIPT_DIR/tmp
    cd tmp
    cargo build --release
    sudo mv $SCRIPT_DIR/tmp/target/release/swww /usr/bin/
    sudo mv $SCRIPT_DIR/tmp/target/release/swww-daemon /usr/bin
    cd $SCRIPT_DIR
    rm -rf $SCRIPT_DIR/tmp

    swww img $DOTFILE_DIR/wallpapers/wallpaper01.png
  fi
}

function install_packages {
  # git status
  gitstatus_install

  # tmux
  emerge_check "app-misc/tmux"

  # tpm
  tpm_install

  # gitmux
  gitmux_install

  # hyprland
  emerge_check "gui-wm/hyprland"

  # swww
  swww_install

  # kitty
  emerge_check "x11-terms/kitty"

  # waybar
  emerge_check "gui-apps/waybar"

  # dunst
  emerge_check "x11-misc/dunst"

  # nvim
  emerge_check "app-editors/neovim"

  # tofi
  emerge_check "gui-apps/tofi"

  # fonts
  emerge_check "media-fonts/noto-emoji"
  emerge_check "media-fonts/noto-cjk"
  emerge_check "media-fonts/alee-fonts"
  emerge_check "media-fonts/fontawesome"
  emerge_check "media-fonts/nerd-fonts"
  
  # kime
  emerge_check "app-i18n/kime"

  # obsidian
  emerge_check "app-office/obsidian"
}
