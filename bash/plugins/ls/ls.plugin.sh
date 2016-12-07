
if is_true $__IS_MAC; then
	# List only directories
	function lld {
		ls -lh $@ | grep '^d'
	}
	function llda {
		ls -lah $@ | grep '^d'
	}

	# List only directories
	function llf {
		ls -lh $@ | grep --color=never '^[^d]'
	}
	function llfa {
		ls -lah $@ | grep --color=never '^[^d]'
	}
fi

function symlink {
	if [ -z $1 ]; then
		echo 'argv1 => source_file path.'
		return 1
	fi
	if [ -z $2 ]; then
		echo 'argv2 => new symlink path or name.'
		return 1
	fi
	local source_file="$1"
	local target_file="$2"

	ln -s "$source_file" "$target_file"
}

function copy_datetime {
	date '+%Y-%m-%d %H:%M:%S'
	printf %s "$(date '+%Y-%m-%d %H:%M:%S')" | pbcopy
}
