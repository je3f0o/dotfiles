
function __jeefo_ensure_dir {
    local dir=`dirname "$1"`
    [ ! -d "$dir" ] && mkdir -p "$dir"
}

function __jeefo_symlink {
    local from="$1"
    local to_path="$2"
    local backup_path="$3"

    # Delete if symbolic link is already exists.
    [ -L "$to_path" ] && rm -rf "$to_path"

    # Backup if older version file or directory
    if [ -e "$to_path" ]; then
        __jeefo_ensure_dir "$backup_path"
        mv "$to_path" "$backup_path"
    fi

    __jeefo_ensure_dir "$to_path"

    # Linking symbolic links
    ln -s "$from" "$to_path"
}

function __jeefo_link {
    local file
    local from
    local to_path
    local dotfiles=(bash bash_profile vim vimrc tmux tmux.conf gitconfig jshintrc)
    local backup_dir=~/.backup_dotfiles/`date +%F_%H-%M-%S`

    echo -e "\x1b[36m[INFO]\x1b[0m Linking..."

    for file in ${dotfiles[@]}; do
        from=~/cloud/dotfiles/"$file"
        to_path=~/."$file"

        __jeefo_symlink "$from" "$to_path" "$backup_dir/$file"
    done

    # Termintator config
    if [ "$JEEFO_ENV_OS_NAME" == 'Linux' ]; then
        file=terminator_config
        from=~/cloud/dotfiles/"$file"
        to_path=~/.config/terminator/config

        __jeefo_symlink "$from" "$to_path" "$backup_dir/$file"
    fi
}
