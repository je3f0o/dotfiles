
# Total files count
function total_files {
	local target=${1-.}
	find "$target" -type f | wc -l
}

function total_lines {
  find . -type f -name "*.swift" -exec wc -l {} +
}

function total_size {
	du -sh ${1-.}
}