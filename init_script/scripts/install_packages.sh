#!/bin/bash

function gitstatus_install {
  if [ ! -f $HOME/gitstatus ]; then
    git clone --depth=1 https://github.com/romkatv/gitstatus.git $HOME/gitstatus
  fi
}

function gitstatus_test {
  if [ ! -d $HOME/gitstatus ]; then
    echo -e "no gitstatus..."
    echo -e "test failed..."
    exit 1
  fi
}

function tpm_install {
  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi
}

function tpm_test {
  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo -e "no tpm..."
    echo -e "test failed..."
    exit 1
  fi
}

function gitmux_install {
  if [ ! -f $HOME/go/bin/gitmux ]; then
    if [ ! -f /usr/bin/gitmux ]; then
      go install github.com/arl/gitmux@latest
      sudo mv $HOME/go/bin/gitmux /usr/bin
    fi
  fi
}

function gitmux_test {
  if ! command -v gitmux > /dev/null; then
    echo -e "no gitmux..."
    echo -e "test failed..."
    exit 1
  fi
}

function swww_install {
  if [ ! -f /usr/bin/swww ] && [ ! -f /usr/bin/swww-daemon ]; then
    git clone https://github.com/LGFae/swww.git $SCRIPT_DIR/tmp
    cd tmp
    cargo build --release
    sudo mv $SCRIPT_DIR/tmp/target/release/swww /usr/bin/
    sudo mv $SCRIPT_DIR/tmp/target/release/swww-daemon /usr/bin
    cd $SCRIPT_DIR
    rm -rf $SCRIPT_DIR/tmp
  fi
}

function swww_test {
  if ! command -v swww > /dev/null && ! command -v swww-daemon > /dev/null; then
    echo -e "no swww..."
    echo -e "test failed..."
    exit 1
  fi
}

function install_packages {
  local packages=(\
    "dev-lang/go"\
    "app-arch/lz4"\
    "app-misc/tmux"\
    "gui-wm/hyprland"\
    "gui-apps/waybar"\
    "x11-misc/dunst"\
    "app-editors/neovim"\
    "gui-apps/tofi"\
    "media-fonts/noto-emoji"\
    "media-fonts/noto-cjk"\
    "media-fonts/alee-fonts"\
    "media-fonts/fontawesome"\
    "media-fonts/nerd-fonts"\
    "app-i18n/kime"\
    "app-office/obsidian"\
  )
  
  local emerge_packages=""

  for index in ${!packages[*]}; do  
    if ! qlist -IRv | grep -q "$name"; then
      emerge_packages="$emerge_packages${packages[$index]} "
    fi
  done

  if [ "$emerge_packages" != "" ]; then
    echo "emerge_packages: $emerge_packages"

    # sudo emerge -vq $emerge_packages

    # tpm_install
    # gitstatus_install
    # gitmux_install
    # swww_install
  fi
}

function install_packages_test {
  local packages=(\
    "dev-lang/go"\
    "app-arch/lz4"\
    "app-misc/tmux"\
    "gui-wm/hyprland"\
    "gui-apps/waybar"\
    "x11-misc/dunst"\
    "app-editors/neovim"\
    "gui-apps/tofi"\
    "media-fonts/noto-emoji"\
    "media-fonts/noto-cjk"\
    "media-fonts/alee-fonts"\
    "media-fonts/fontawesome"\
    "media-fonts/nerd-fonts"\
    "app-i18n/kime"\
    "app-office/obsidian"\
  )

  echo -e "\e[1minstall_packages test\e[0m"

  for index in ${!packages[*]}; do  
    if ! qlist -IRv | grep -q "$name"; then
      echo -e "no ${packages[$index]}..."
      echo -e "test failed..."
      exit 1
    fi
  done

  gitstatus_test
  tpm_test
  gitmux_test
  swww_test

  echo -e "\e[1mpassed\e[0m"
}
