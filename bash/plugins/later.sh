
# unrar all .rar files with directory
find . -type f -iname "*.rar" | while read f; do dir="${f%.*}"; mkdir -p "$dir"; unrar x "$f" "$dir" -y; done

# unzip all .rar files with directory
find . -type f -iname "*.zip" | while read f; do dir="${f%.*}"; mkdir -p "$dir"; unzip -o "$f" -d "$dir"; done

# 
function mychmod {
	return;
	local target;
	while [[ $# > 1 ]]; do
		key="$1"

		case $key in
			-r|--recursive)
				EXTENSION="$2"
				shift # past argument
				;;
			-s|--searchpath)
				SEARCHPATH="$2"
				shift # past argument
				;;
			-l|--lib)
				LIBPATH="$2"
				shift # past argument
				;;
			--default)
				DEFAULT=YES
				;;
			*)
					# unknown option
			;;
		esac
		shift # past argument or value
	done

}

