
# Easier navigation for now
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# copy and remove with folders
alias cp='cp -R'
alias rm='rm -rf'

# Be nice :)
alias please=sudo

# List files
alias ll='ls -lh --color'
alias lla='ls -lah --color'

# List only directories
alias lld='ls -lh --color | grep "^d"'
alias llad='ls -lah --color | grep "^d"'

# List only directories
alias llf='ls -lh  --color | grep "^[^d]"'
alias llaf='ls -lah  --color | grep "^[^d]"'

# Remove all files including hidden files
alias rmall='rm -rf .[^.] .??* *'

# IP addresses
#alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Trim new lines and copy to clipboard
alias trimcopy='tr -d '\n' | pbcopy'

# Shortcuts
alias v='vim'
alias catc='pygmentize'

# Copy git post-commit to current git project
#alias gpost="cp ~/.git/hooks/post-commit .git/hooks"

# bower allow root permanently
alias bower='bower --allow-root'

# debug on bash scripts
xdo_compiler_path="$HOME/Programming/bash/xdo_compiler/compiler.sh"
alias xdo_compiler="bash ${xdo_compiler_path}"
alias xdo_compiler_debug="IMPORT_BASH_DEBUGGER='$HOME/Programming/bash/libs/libtrap.sh' bash ${xdo_compiler_path}"
