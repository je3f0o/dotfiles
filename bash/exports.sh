
#export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

### Added Virtual GL
#export PATH="/opt/VirtualGL/bin:$PATH"

### MySQL
#export PATH="/usr/local/mysql/bin:$PATH"

# BasicTex
export PATH="/usr/local/texlive/2016basic/bin/universal-darwin:$PATH"

# Needed for some older server platforms
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export LC_CTYPE=C
#export LC_ALL=C
#export LANG=C

export EDITOR=vim
#export EDITOR="/usr/local/bin/vim --cmd let weak_mode=1"

if __is_darwin; then
    # Mac colors
	export CLICOLOR=1
	export LSCOLORS=ExFxBxDxCxegedabagacad

    export PATH=$(brew --prefix openvpn)/sbin:$PATH
fi

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
                printf %s "${HOME}/.nvm" || \
                printf %s "${XDG_CONFIG_HOME}/nvm")"
# This will loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
# This will loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
