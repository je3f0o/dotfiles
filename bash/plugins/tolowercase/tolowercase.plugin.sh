
# Stupid HFS+
# case insensitive

function tolowercase_verbose {
	local directory=${1-'.'}
	local temp_dir=/tmp/case_sensitive

	mkdir -p "$temp_dir"

	for src in $(find "$directory" -depth); do
		case "$src" in
			('.'|'..') continue;;
		esac

		local base_name=$(basename "$src" | tr '[A-Z]' '[a-z]')
		local dest_dir=$(dirname $src)
		local dest="${dest_dir}/${base_name}"

		if [ "$src" != "$dest" ]; then
			mv "$src" "${temp_dir}/${base_name}"
			mv "${temp_dir}/${base_name}" "$dest"

			echo "$src -> $dest renamed."

			#if [ ! -e "$dest" ]; then
				#mv -v "$src" "$dest"

				#if [ ! -e "$dest" ]; then
					#echo "$src was not renamed."
				#fi
			#else
				#echo "$dest file is already exists."
			#fi
		fi
	done
}

function tolowercase {
	local directory=${1-'.'}
	find "$directory" -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
}
