
VIM_VIEWDIR=~/.vimview

function clear_vim_viewdir {
    local view_filepath
    local real_filepath

    for view_filepath in "$VIM_VIEWDIR"/*; do
        real_filepath=`
            echo "${view_filepath##*/}" | \
            sed -e 's/\=+/\//g' -e 's/\=$//g' -e "s|^~|$HOME|g"
        `
        if [ ! -f "$real_filepath" ]; then
            echo "Removing: $view_filepath"
            rm "$view_filepath"
        fi
    done
}
