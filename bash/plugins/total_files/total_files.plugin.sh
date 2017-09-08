

# Total files count
function total_files {
	local target=${1-.}
	find "$target" -type f | wc -l
}

function total_lines {
	find . -name "$1" | xargs wc -l
}

function total_size {
	du -sh ${1-.}
}
