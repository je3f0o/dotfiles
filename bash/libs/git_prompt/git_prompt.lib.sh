
function __is_git {
	git rev-parse --is-inside-work-tree -- > /dev/null 2>&1
	__is_git=$?
	return $__is_git
}

function __get_current_git_branch_name {
	git symbolic-ref --short HEAD -- 2>/dev/null
}

function __is_git_changed {
	! git diff --quiet --
}
