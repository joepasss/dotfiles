#!/bin/bash

function hyprland_init {
  emerge_check "gui-wm/hyprland"
}

function kitty_init {
  emerge_check "x11-terms/kitty"
  create_symlink_config $DOTFILE_DIR/kitty/
}

function waybar_init {
  write_use "waybar" "gui-apps/waybar logind network pipewire popups udev wifi"
  emerge_check "gui-apps/waybar"
}

function dunst_init {
  emerge_check "x11-misc/dunst"
  create_symlink_config $DOTFILE_DIR/dunst/
}

function nvim_init {
  emerge_check "app-editors/neovim"
  create_symlink_config $DOTFILE_DIR/nvim/
}

function tofi_init {
  overlay_add "guru" "git" "https://github.com/gentoo-mirror/guru.git"
  unmask_package "tofi" "gui-apps/tofi ~amd64"
  emerge_check "gui-apps/tofi"
  create_symlink_config $DOTFILE_DIR/tofi/
}

function i18n {
  emerge_check "media-fonts/noto-emoji"
  emerge_check "media-fonts/noto-cjk"
  emerge_check "media-fonts/alee-fonts"
  emerge_check "media-fonts/fontawesome"

  overlay_add "xarblu-overlay" "git" "https://github.com/gentoo-mirror/xarblu-overlay.git"
  unmask_package "nerd-fonts" "media-fonts/nerd-fonts ~amd64 ~x86"
  write_use "nerd-fonts" "media-fonts/nerd-fonts d2coding firacode firamono hack jetbrainmono"
  emerge_check "media-fonts/nerd-fonts"

  overlay_add "riey" "git" "https://github.com/Riey/overlay"
  emerge_check "app-i18n/kime"
  create_symlink_config $DOTFILE_DIR/kime/
}

function swww_init {
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

function obsidian_install {
  overlay_add "guru" "git" "https://github.com/gentoo-mirror/guru.git"
  unmask_package "obsidian" "app-office/obsidian ~amd64 ~arm64"
  write_use "obsidian" "app-office/obsidian l10n_ko"
  emerge_check "app-office/obsidian"
}

function gui_init {
  hyprland_init
  kitty_init
  waybar_init
  dunst_init
  nvim_init
  i18n
  swww_init
  obsidian_install
}
