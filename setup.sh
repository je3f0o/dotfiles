#!/bin/bash

source installer/shared.sh

function __jeefo_require_brew {
  __is_darwin || return

  local url=https://raw.githubusercontent.com/Homebrew/install/master/install.sh
  brew --version &> /dev/null
  if [ $? != 0 ]; then
    __console_info 'Homebrew'
    curl -fsSL $uurl
  fi
}

function __jeefo_require_git {
  git --version &> /dev/null
  if [ $? != 0 ]; then
    __console_info 'Git'
    $(__is_darwin && brew install git || sudo apt-get install git -y) || exit 1
  fi
}

function __is_git {
    git symbolic-ref --quiet HEAD &> /dev/null
    [ $? -ne 128 ]
}

__jeefo_require_brew;
__jeefo_require_git;

mkdir -p ~/cloud/dotfiles && cd ~/cloud/dotfiles
if ! __is_git; then 
  git clone https://github.com/je3f0o/dotfiles.git . || echo exit 1
fi

source installer/setup.sh