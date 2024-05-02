#!/bin/bash

function write_use_flag {
  write_use "waybar" "gui-apps/waybar logind network pipewire popups udev wifi" 
  write_use "nerd-fonts" "media-fonts/nerd-fonts d2coding firacode firamono hack jetbrainmono"
  write_use "obsidian" "app-office/obsidian l10n_ko"
}
