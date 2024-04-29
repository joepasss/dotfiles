# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# Aliases
alias refresh="source ~/.bashrc"
alias run="hyprctl dispatch exec"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias mac="ssh"
alias sleep="loginctl suspend"
alias Hyprland="dbus-launch --exit-with-session Hyprland -c ~/dotfiles/hypr/hyprland.conf"

# run gui-programs
alias firefox="hyprctl dispatch exec firefox"
alias obsidan="hyprctl dispatch exec obsidian"

# for development
alias cwa="~/projects/cwa/cwa.sh"

# ssh config
export TERM="xterm-256color"

# neofetch start
neofetch

# git prompt
source ~/gitstatus/gitstatus.prompt.sh
