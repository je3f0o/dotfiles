# There is a builtin variable called OSTYPE
# legacy var depricated
JEEFO_ENV_OS_NAME=`uname`

source installer/installer.sh
source installer/linker.sh

# Toys
if __is_darwin; then
  $(lolcat --version &> /dev/null) || brew install lolcat
  $(cowsay hello > /dev/null) || brew install cowsay
  $(fortune -n 0 &> /dev/null) || brew install fortune
else
  sudo apt-get update && sudo apt-get install lolcat cowsay fortune -y
fi

__jeefo_install
__jeefo_link

__console_info 'Done'