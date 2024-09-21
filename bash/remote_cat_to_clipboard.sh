# Function to copy remote file contents to clipboard
remote_cat_to_clipboard() {
    local remote_path="$1"
    local server="jeefo@tmc"

    # Check if the remote file is provided
    if [ -z "$remote_path" ]; then
        echo "Error: Please provide a remote file path."
        return 1
    fi

    # SSH to the remote server and copy file content to clipboard
    ssh "$server" "cat '$remote_path'" | pbcopy
}

# Autocomplete remote files using ls and filter based on input
_remote_file_complete() {
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    local files
    files=$(ssh jeefo@tmc "ls -1a" 2>/dev/null)

    local matches
    matches=($(echo "$files" | grep "^$cur"))

    COMPREPLY='zzz'
}

# Enable autocompletion for the function
complete -F _remote_file_complete remote_cat_to_clipboard