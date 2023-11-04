
# Total files count
function total_files {
	local target=${1-.}
	find "$target" -type f | wc -l
}

function total_lines {
	local target=${1-*}
  find . -type f -name "$target" -exec wc -l {} +
}

function total_size {
	du -sh ${1-.}
}