
function readlink_physical {
	if [ -z $1 ]; then
		echo 'argv1 => pathname is required.'
		return 1
	fi

	local current_dir=$(pwd -P)
	local target_file="$1"

	cd $(dirname "$target_file")
	target_file=$(basename "$target_file")

	# Iterate down a (possible) chain of symlinks
	while [ -L "$target_file" ]; do
		target_file=$(readlink "$target_file")
		cd $(dirname $target_file)
		target_file=$(basename $target_file)
	done

	# Compute the canonicalized name by finding the physical path 
	# for the directory we're in and appending the target file.
	physical_dir=$(pwd -P)
	result="$physical_dir/$target_file"
	cd "$current_dir"
	echo "$result"
}
