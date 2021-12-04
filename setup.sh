#!/bin/bash

# There is a builtin variable called OSTYPE
# legacy var depricated
JEEFO_ENV_OS_NAME=`uname`

function __jeefo_info {
    echo -e "\x1b[36m[INFO]\x1b[0m Trying to install \x1b[32m$@\x1b[0m"
}

function __is_darwin {
    [ `uname` == "Darwin" ]
}

function __jeefo_install_brew {
    __jeefo_info 'Homebrew'
    local u=https://raw.githubusercontent.com/Homebrew/install/master/install.sh
    brew --version &> /dev/null
    [ $? != 0 ] && /bin/bash -c $(curl -fsSL $u)
}

if __is_darwin; then
    __jeefo_install_brew

    [ lolcat --version &> /dev/null ] || brew install lolcat
    [ cowsay --version &> /dev/null ] || brew install cowsay
else
    sudo apt-get update && sudo apt-get install lolcat cowsay -y
fi

git --version &> /dev/null
if [ $? != 0 ]; then
    __jeefo_info 'Git'
    __is_darwin && brew install git || sudo apt-get install git -y
    [ $? != 0 ] && exit 1
fi

git clone https://github.com/je3f0o/dotfiles.git . || exit 1

source "installer/installer.sh"
source "installer/linker.sh"

__jeefo_install
__jeefo_link

echo -e "\x1b[36m[INFO]\x1b[0m Done."