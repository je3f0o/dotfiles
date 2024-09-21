
# List files
if is_true $__IS_MAC; then
  alias ls='gls --color=always --time-style=long-iso'
else
  alias ls='ls --color=always --time-style=long-iso'
fi

function ll {
  ls -lht --group-directories-first "$@" | grep -v '^total'
}
function lla {
  ls -lhta --group-directories-first "$@" | grep -v '^total'
}
if [ $(uname) != "Darwin" ]; then
  function total_disk_usage {
    local total=$(df -h --total)
    echo "$total" | head -n1
    echo "$total" | tail -n1
  }
fi

# Easier navigation for now
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# alias jeefo_importer=~/projects/api/bin/jeefo_importer
# alias batery_state="upower -i $(upower -e | grep BAT) | grep state | awk '{print \$2}'"

# copy with folders
alias cp='rsync -avP --exclude ".*.swp" --exclude ".*.swo"'

# Be nice :)
alias pls=sudo
alias please=sudo

# some more grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Docker
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}"'
alias dc='docker compose'

# Git
alias gd='git d'

# Remove all files including hidden files
alias rmall='rm -rf .[^.] .??* *'

# IP addresses
#alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Trim new lines and copy to clipboard
alias trimcopy='tr -d '\n' | pbcopy'

# Shutdown
alias shutdown='shutdown -h now'

# -nw, --no-window-system
alias emacs="emacs -nw $@"

# tmux local socket
alias tmux_local="tmux -L $TERM"

# FFmpeg hide banner
alias ffmpeg="ffmpeg -hide_banner"

# less with colors
alias less="less -r"

function upload_session {
  if [ -z $1 ]; then
    echo 'argv1 => session name.'
    return 1
  fi
    local session_name="$1"
    tar czf "$session_name.tar.gz" "$session_name"
    scp "$session_name.tar.gz" jeefo@wmc1:~/sessions
    rm "$session_name.tar.gz"

    ssh wmc1 "
        cd ~/sessions
        tar xzf $session_name.tar.gz --warning=no-timestamp -m
        rm $session_name.tar.gz
    "
}

function login_wmc1 {
    local user_name="${1-jeefo}"
    local server_id="${2-wmc1}"
    ssh "$user_name"@"$server_id" -t 'cd projects/wmc; exec $SHELL -l'
}

function login_fix_server {
    local user_name="${1-adminf}"
    local server_id="${2-fix_server}"
    ssh "$user_name"@"$server_id"
}

function nasa_email {
  curl "https://gcn.gsfc.nasa.gov/gcn3/${1}.gcn3"
}

function redir_command_on {
  redir_command_on = "echo 'rdr pass on %iface inet proto tcp from any to any port %port -> localhost port %rport'"
  return
  if [ -a "/tmp/osx_ipfw_rules" ]; then
    ipfw -q add `head -n 1 osx_ipfw_rules` fwd 127.0.0.1,$1 tcp from any to any $2 in via $3
  else
    ipfw add fwd 127.0.0.1,$1 tcp from any to any $2 in via $3 | cut -d " " -f 1 >> /tmp/osx_ipfw_rules
  fi
}

function redir_command_off {
  redir_command_off = "pfctl -F all -f /etc/pf.conf"
  return
  if [ -a "/tmp/osx_ipfw_rules" ]; then
    ipfw -q delete `head -n 1 /tmp/osx_ipfw_rules`
    rm -f /tmp/osx_ipfw_rules
  fi
}

# Copy git post-commit to current git project
#alias gpost="cp ~/.git/hooks/post-commit .git/hooks"

# bower allow root permanently
#alias bower='bower --allow-root'

# debug on bash scripts
#xdo_compiler_path="$HOME/Programming/bash/xdo_compiler/compiler.sh"
#alias xdo_compiler="bash ${xdo_compiler_path}"
#alias xdo_compiler_debug="IMPORT_BASH_DEBUGGER='$HOME/Programming/bash/libs/libtrap.sh' bash ${xdo_compiler_path}"

# GNU sed
#if __is_command_exists gsed; then
  #alias sed=gsed
#fi

# Automatically add completion for all aliases to commands having completion functions
function alias_completion {
    local namespace="alias_completion"

    # parse function based completion definitions, where capture group 2 => function and 3 => trigger
    local compl_regex='complete( +[^ ]+)* -F ([^ ]+) ("[^"]+"|[^ ]+)'
    # parse alias definitions, where capture group 1 => trigger, 2 => command, 3 => command arguments
    local alias_regex="alias ([^=]+)='(\"[^\"]+\"|[^ ]+)(( +[^ ]+)*)'"

    # create array of function completion triggers, keeping multi-word triggers together
    eval "local completions=($(complete -p | sed -Ene "/$compl_regex/s//'\3'/p"))"
    (( ${#completions[@]} == 0 )) && return 0

    # create temporary file for wrapper functions and completions
    rm -f "/tmp/${namespace}-*.tmp" # preliminary cleanup
    local tmp_file; tmp_file="$(mktemp "/tmp/${namespace}-${RANDOM}XXX.tmp")" || return 1

    local completion_loader; completion_loader="$(complete -p -D 2>/dev/null | sed -Ene 's/.* -F ([^ ]*).*/\1/p')"

    # read in "<alias> '<aliased command>' '<command args>'" lines from defined aliases
    local line; while read line; do
        eval "local alias_tokens; alias_tokens=($line)" 2>/dev/null || continue # some alias arg patterns cause an eval parse error
        local alias_name="${alias_tokens[0]}" alias_cmd="${alias_tokens[1]}" alias_args="${alias_tokens[2]# }"

        # skip aliases to pipes, boolean control structures and other command lists
        # (leveraging that eval errs out if $alias_args contains unquoted shell metacharacters)
        eval "local alias_arg_words; alias_arg_words=($alias_args)" 2>/dev/null || continue
        # avoid expanding wildcards
        read -a alias_arg_words <<< "$alias_args"

        # skip alias if there is no completion function triggered by the aliased command
        if [[ ! " ${completions[*]} " =~ " $alias_cmd " ]]; then
            if [[ -n "$completion_loader" ]]; then
                # force loading of completions for the aliased command
                eval "$completion_loader $alias_cmd"
                # 124 means completion loader was successful
                [[ $? -eq 124 ]] || continue
                completions+=($alias_cmd)
            else
                continue
            fi
        fi
        local new_completion="$(complete -p "$alias_cmd")"

        # create a wrapper inserting the alias arguments if any
        if [[ -n $alias_args ]]; then
            local compl_func="${new_completion/#* -F /}"; compl_func="${compl_func%% *}"
            # avoid recursive call loops by ignoring our own functions
            if [[ "${compl_func#_$namespace::}" == $compl_func ]]; then
                local compl_wrapper="_${namespace}::${alias_name}"
                    echo "function $compl_wrapper {
                        (( COMP_CWORD += ${#alias_arg_words[@]} ))
                        COMP_WORDS=($alias_cmd $alias_args \${COMP_WORDS[@]:1})
                        (( COMP_POINT -= \${#COMP_LINE} ))
                        COMP_LINE=\${COMP_LINE/$alias_name/$alias_cmd $alias_args}
                        (( COMP_POINT += \${#COMP_LINE} ))
                        $compl_func
                    }" >> "$tmp_file"
                    new_completion="${new_completion/ -F $compl_func / -F $compl_wrapper }"
            fi
        fi

        # replace completion trigger by alias
        new_completion="${new_completion% *} $alias_name"
        echo "$new_completion" >> "$tmp_file"
    done < <(alias -p | sed -Ene "s/$alias_regex/\1 '\2' '\3'/p")
    source "$tmp_file" && rm -f "$tmp_file"
}; alias_completion