# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
  # Shell is non-interactive.  Be done now!
  return
fi

# go/bin
export PATH="$HOME/go/bin:$PATH"

# my script
export PATH="$PATH:$HOME/scripts"

# Aliases
alias refresh="source ~/.bashrc"
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias ranger="export TERM=kitty; ranger ."
alias tmux="export TERM='xterm-256color'; tmux"

# ssh config
export TERM="xterm-256color"

# git prompt
source ~/gitstatus/gitstatus.prompt.sh
