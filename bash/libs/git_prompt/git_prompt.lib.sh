
function __is_git {
    git symbolic-ref --quiet HEAD &> /dev/null
    [ $? -ne 128 ]
}

function __get_current_git_branch_name {
	git symbolic-ref --short HEAD -- 2> /dev/null
}

function __is_git_changed {
	local __status__=`git status --porcelain --ignore-submodules 2> /dev/null | tail -n1`
    [ -n "$__status__" ]
}
