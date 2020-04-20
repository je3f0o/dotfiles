#!/bin/bash

# Not necessary in this case. But useful trick to know.
base_dir=`dirname "$0"`

source "$base_dir/installer/installer.sh"
source "$base_dir/installer/linker.sh"

__jeefo_install
__jeefo_link
