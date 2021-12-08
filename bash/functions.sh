
# Create a new directory and enter it
function md {
    mkdir -p "$1" && cd "$1"
}

# Find shorthand
function f {
    find . -name "$1"
}

#function rm {
#    local path
#    for path in "$@"; do
#        if [ "$path" == ~ ]; then
#            echo "Cannot delete HOME folder. It canceled." >&2
#            return 1;
#        fi
#    done
#
#    # for debug
#    #echo "Deleting '$@'"
#
#    /bin/rm -rf "$@"
#}

# Copy w/ progress
function cp_p {
    rsync -WavP --human-readable --progress "$1" "$2"
}

function real-ip {
    dig +short myip.opendns.com @resolver1.opendns.com
}

private_fn_path=~/private/functions.sh
[ -e $private_fn_path ] && source $private_fn_path
unset private_fn_path

function auto-rename-tmux-window {
    local LPWD=''
    if [ "${PWD}" != "${LPWD}" ]; then
        LPWD="$PWD"
        tmux rename-window ${PWD//*\//}
    fi
}
#export PROMPT_COMMAND=auto-rename-tmux-window

# Let's toss an image onto my server and pbcopy that bitch.
function myscp {
    scp "$1" "jeefo@${2}:${3}";
}

# # cd into whatever is the forefront Finder window.
# cdf() {  # short for cdfinder
#   cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
# }

# # git log with per-commit cmd-clickable GitHub URLs (iTerm)
# function gf() {
#   local remote="$(git remote -v | awk '/^origin.*\(push\)$/ {print $2}')"
#   [[ "$remote" ]] || return
#   local user_repo="$(echo "$remote" | perl -pe 's/.*://;s/\.git$//')"
#   git log $* --name-status --color | awk "$(cat <<AWK
#     /^.*commit [0-9a-f]{40}/ {sha=substr(\$2,1,7)}
#     /^[MA]\t/ {printf "%s\thttps://github.com/$user_repo/blob/%s/%s\n", \$1, sha, \$2; next}
#     /.*/ {print \$0}
# AWK
#   )" | less -F
# }



# # Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# # Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
# function httpcompression() {
#   encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
# }


# # take this repo and copy it to somewhere else minus the .git stuff.
# function gitexport(){
#   mkdir -p "$1"
#   git archive master | tar -x -C "$1"
# }



# # get gzipped size
# function gz() {
#   echo "orig size    (bytes): "
#   cat "$1" | wc -c
#   echo "gzipped size (bytes): "
#   gzip -c "$1" | wc -c
# }

# # All the dig info
# function digga() {
#   dig +nocmd "$1" any +multiline +noall +answer
# }

# # Escape UTF-8 characters into their 3-byte format
# function escape() {
#   printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
#   echo # newline
# }

# # Decode \x{ABCD}-style Unicode escape sequences
# function unidecode() {
#   perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
#   echo # newline
# }

# # Extract archives - use: extract <file>
# # Based on http://dotfiles.org/~pseup/.bashrc
# function extract() {
#   if [ -f "$1" ] ; then
#       local filename=$(basename "$1")
#       local foldername="${filename%%.*}"
#       local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
#       local didfolderexist=false
#       if [ -d "$foldername" ]; then
#           didfolderexist=true
#           read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
#           echo
#           if [[ $REPLY =~ ^[Nn]$ ]]; then
#               return
#           fi
#       fi
#       mkdir -p "$foldername" && cd "$foldername"
#       case $1 in
#           *.tar.bz2) tar xjf "$fullpath" ;;
#           *.tar.gz) tar xzf "$fullpath" ;;
#           *.tar.xz) tar Jxvf "$fullpath" ;;
#           *.tar.Z) tar xzf "$fullpath" ;;
#           *.tar) tar xf "$fullpath" ;;
#           *.taz) tar xzf "$fullpath" ;;
#           *.tb2) tar xjf "$fullpath" ;;
#           *.tbz) tar xjf "$fullpath" ;;
#           *.tbz2) tar xjf "$fullpath" ;;
#           *.tgz) tar xzf "$fullpath" ;;
#           *.txz) tar Jxvf "$fullpath" ;;
#           *.zip) unzip "$fullpath" ;;
#           *) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
#       esac
#   else
#       echo "'$1' is not a valid file"
#   fi
# }

