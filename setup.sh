#!/bin/bash

# Not necessary in this case. But useful trick to know.
base_dir=`dirname "$0"`

# There is a builtin variable called OSTYPE
# if [[ $OSTYPE == 'darwin'* ]]; then...
JEEFO_ENV_OS_NAME=`uname`

source "$base_dir/installer/installer.sh"
source "$base_dir/installer/linker.sh"

__jeefo_install
__jeefo_link

echo -e "\x1b[36m[INFO]\x1b[0m Done."
