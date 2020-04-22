
function __jeefo_link {
    local from
    local to_path
    local dotfiles=(bash bash_profile vim vimrc tmux tmux.conf gitconfig jshintrc)
    local backup_dir=~/.backup_dotfiles/`date +%F_%H-%M-%S`

    echo -e "\x1b[36m[INFO]\x1b[0m Linking..."

    for file in ${dotfiles[@]}; do
        from=~/cloud/dotfiles/"$file"
        to_path=~/."$file"

        # Delete if symbolic link is already exists.
        [ -L "$to_path" ] && rm -rf "$to_path"

        # Backup if older version file or directory
        if [ -e "$to_path" ]; then
            # Create backup folder if doesn't exists
            [ ! -d "$date_str" ] && mkdir -p "$backup_dir"

            mv "$to_path" "$backup_dir/$file"
        fi

        # Linking symbolic links
        ln -s "$from" "$to_path"
    done
}
