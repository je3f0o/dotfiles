
#export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

### Added Virtual GL
#export PATH="/opt/VirtualGL/bin:$PATH"

# Mac color
if [ $__IS_MAC ]; then
	export CLICOLOR=1
	export LSCOLORS=ExFxBxDxCxegedabagacad
fi

### MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# BasicTex
export PATH="/usr/local/texlive/2016basic/bin/universal-darwin:$PATH"

# Needed for some older server platforms
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export LC_CTYPE=C
#export LC_ALL=C
#export LANG=C

export EDITOR=/usr/bin/nano
#export EDITOR="/usr/local/bin/vim --cmd let weak_mode=1"
