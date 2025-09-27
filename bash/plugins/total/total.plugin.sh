
# Total files count
function total_files {
	local target=${1:-.}
	find "$target" -type f | wc -l
}

total_lines() {
  local target="${1:-.}"
  find "$target" -type f -exec cat {} + | wc -l
}

function total_size {
	du -sh ${1:-.}
}

function total_commits {
  git rev-list --count HEAD
}