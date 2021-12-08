# There is a builtin variable called OSTYPE
# legacy var depricated
JEEFO_ENV_OS_NAME=`uname`

# Toys
if __is_darwin; then
  __jeefo_install_brew

  [ lolcat --version &> /dev/null ] || brew install lolcat
  [ cowsay --version &> /dev/null ] || brew install cowsay
  [ fortune --version &> /dev/null ] || brew install fortune
else
  sudo apt-get update && sudo apt-get install lolcat cowsay fortune -y
fi

source "installer/installer.sh"
source "installer/linker.sh"

__jeefo_install
__jeefo_link

echo -e "\x1b[36m[INFO]\x1b[0m Done."