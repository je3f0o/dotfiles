# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
  elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    unset LC_CTYPE
    unset LC_ALL
    unset LANG
	. $(brew --prefix)/etc/bash_completion
  fi
fi

# Start bootstrap
source ~/.bash/bootstrap.sh

if __is_darwin; then
  # Maybe from brew or something...
  export PATH="$PATH:$(go env GOPATH)/bin"

  # Added by OrbStack: command-line tools and integration
  # Comment this line if you don't want it to be added again.
  source ~/.orbstack/shell/init.bash 2>/dev/null || :

  source <(kubectl completion bash)
else
  export PATH="$PATH:$HOME/go/bin"
fi

# jeefo_command auto-completion
#source ~/.bash/jeefo_command/jeefo_commands.sh

export BASH_SILENCE_DEPRECATION_WARNING=1
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Added by `rbenv init` on Sun Mar  9 03:48:34 +08 2025
eval "$(rbenv init - --no-rehash bash)"
