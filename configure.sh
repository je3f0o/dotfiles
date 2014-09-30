#!/bin/bash

dotfiles=(bash bashrc vim vimrc)

function backup {
	local backup_dir=~/.backup-dotfiles
	local file=$backup_dir/.$1.bkup
	local index=0
	
	[ ! -d $backup_dir ] && mkdir -p $backup_dir

	while [ -r "${file}_${index}" ]; do
		index=$(($index + 1))
	done

	printf "${file}_${index}"
}

function symlink {
	local file=$1
	
	[ -L ~/.$file ] && rm -f ~/.$file
	[ -e ~/.$file ] && mv ~/.$file $(backup $file)

	ln -s ~/cloud/dotfiles/.$file ~/.$file
}


for file in ${dotfiles[@]}; do
	symlink $file
done

