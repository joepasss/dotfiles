#!/bin/bash

function write_use_flags {
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

  echo -e "\e[1mwrite use flags ....\e[0m"

  for index in ${package_names[*]}; do
    local dest="/etc/portage/package.use/${package_names[$index]}"

    if [ -e $dest ]; then
      sudo rm -rf $dest
    fi

    sudo touch $dest
    echo "${package_use_flags[index]}" | sudo tee -a $dest > /dev/null
  done
}
