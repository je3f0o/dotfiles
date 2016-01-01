#!/bin/bash

# Disable interpreting for Vim Ctrl+S to save file

function vim_mac {
	# osx users, use stty -g
	local STTYOPTS="$(stty -g)"
	stty stop '' -ixoff
	command vim $@
	stty "$STTYOPTS"
}

function vim_linux {
	local STTYOPTS="$(stty --save)"
	stty stop '' -ixoff
	command vim $@
	stty "$STTYOPTS"
}

if is_true $__IS_MAC; then
	alias vim=vim_mac
else
	alias vim=vim_linux
fi

alias v=vim
