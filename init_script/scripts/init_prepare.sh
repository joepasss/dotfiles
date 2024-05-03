#!/bin/bash

echo "install dependencies ..."

function overlay_add {
  overlay_add "guru" "git" "https://github.com/gentoo-mirror/guru.git"
  overlay_add "xarblu-overlay" "git" "https://github.com/gentoo-mirror/xarblu-overlay.git"
  overlay_add "riey" "git" "https:/github.com/Riey/overlay"
}

function emerge_dependencies {
  emerge_check "app-portage/gentoolkit"
  emerge_check "app-eselect/eselect-repository"
  emerge_check "app-arch/lz4"
  emerge_check "dev-lang/go"
  emerge_check "net-libs/nodejs"

  overlay_add

  emerge_check "dev-vcs/lazygit"
}

function unmask_pacakge {
  unmask_package "lazygit" "dev-vcs/lazygit ~amd64"
  unmask_package "tofi" "gui-apps/tofi ~amd64"
  unmask_package "nerd-fonts" "media-fonts/nerd-fonts ~amd64 ~x86"
  unmask_package "obsidian" "app-office/obsidian ~amd64 ~arm64"
}
