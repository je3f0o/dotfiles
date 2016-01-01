#!/bin/bash

function backup {
	local backup_dir=~/.backup-dotfiles
	local file="${backup_dir}/.${1}.bkup"
	local index=0
	
	[ ! -d "$backup_dir" ] && mkdir -p "$backup_dir"

	while [ -r "${file}_$index" ]; do
		index=$(($index + 1))
	done

	printf "${file}_$index"
}

function symlink {
	local from=~/cloud/dotfiles/"$1"
	local to_filename="$2"
	local to_path=~/."$to_filename"
	
	# Be careful with `rm -rf` command. Only use it for symbolic links.
	if [ -L "$to_path" ]; then
		echo "Removing symbolic link: $to_path"
		rm -rf "$to_path" # symbolic link exists
	fi
	if [ -e "$to_path" ]; then
		echo "Backuping existing file: $to_path"
		mv "$to_path" $(backup "$to_filename") # file exists
	fi

	ln -s "$from" "$to_path"
}

dotfiles=(bash vim jshintrc)
for file in ${dotfiles[@]}; do
	symlink "$file" "$file"
done

bashrc='bashrc'
if [[ $OSTYPE == 'darwin'* ]]; then
	bashrc='bash_profile'
fi

symlink vim/vimrc     vimrc
symlink bash/bashrc   "$bashrc"
symlink git/gitconfig gitconfig
