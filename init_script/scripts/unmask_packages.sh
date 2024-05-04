#!/bin/bash

function unmask_packages {
 local package_names=(\
    "lazygit"\
    "tofi"\
    "nerd-fonts"\
    "obsidian"\
  )

local package_unmasks=(\
    "dev-vcs/lazygit ~amd64"\
    "gui-apps/tofi ~amd64"\
    "media-fonts/nerd-fonts ~amd64 ~x86"\
    "app-office/obsidian ~amd64 ~arm64"\
  ) 

  echo -e "\e[1munmask packages ...\e[0m"

  for index in ${!package_names[*]}; do
    local dest="/etc/portage/package.accept_keywords/${package_names[$index]}"

    if [ -e $dest ]; then
      sudo rm -rf $dest
    fi

    sudo touch $dest
    echo "${package_unmasks[index]}" | sudo tee -a $dest > /dev/null
  done
}


