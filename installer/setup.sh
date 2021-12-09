# There is a builtin variable called OSTYPE
# legacy var depricated
JEEFO_ENV_OS_NAME=$(uname)

source installer/installer.sh
source installer/linker.sh

# Toys
if __is_darwin; then
  $(tree --version &> /dev/null) || brew install tree
  $(watch --version &> /dev/null) || brew install watch
  $(lolcat --version &> /dev/null) || brew install lolcat
  $(cowsay hello > /dev/null) || brew install cowsay
  $(fortune -n 0 &> /dev/null) || brew install fortune
else
  $(tree --version &> /dev/null) || sudo apt-get install -y tree
  $(watch --version &> /dev/null) || sudo apt-get install -y watch
  $(lolcat --version &> /dev/null) || sudo apt-get install -y lolcat
  $(cowsay hello > /dev/null) || sudo apt-get install -y cowsay
  $(fortune -n 0 &> /dev/null) || sudo apt-get install -y fortune

  if ! test -f /usr/share/cowsay/cows/small.cow; then
    sudo ln -s /usr/share/cowsay/cows/default.cow \
               /usr/share/cowsay/cows/small.cow
  fi
fi

__jeefo_install
__jeefo_link

__console_info 'Done'