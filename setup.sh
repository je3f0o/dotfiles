#!/bin/bash

# There is a builtin variable called OSTYPE
# legacy var depricated
JEEFO_ENV_OS_NAME=`uname`

function __is_darwin {
    [ `uname` == "Darwin" ]
}

__is_darwin || apt-get update

git --version &> /dev/null
if [ $? != 0 ]; then
    __is_darwin && brew install git || apt-get install git -y
fi

git clone https://github.com/je3f0o/dotfiles.git || exit 1
cd dotfiles

source "installer/installer.sh"
source "installer/linker.sh"

__jeefo_install
__jeefo_link

echo -e "\x1b[36m[INFO]\x1b[0m Done."