
function __git_parse_status {
	__git_status_added=0
	__git_status_modified=0
	__git_status_renamed=0
	__git_status_deleted=0

	while read -r status line; do
		case "$status" in
			A)
				((__git_status_added+=1))
				;;
			M)
				((__git_status_modified+=1))
				;;
			D)
				((__git_status_deleted+=1))
				;;
			R)
				((__git_status_renamed+=1))
				;;
		esac
	done < <(git status --porcelain --branch)

	[ $__git_status_added -gt 0 ] || [ $__git_status_modified -gt 0 ] || [ $__git_status_deleted -gt 0 ]
	__git_status_changed=$?
}

function __print_git_status {
	if [ $__is_git -eq 0 ]; then
		__git_parse_status

		if [ $__git_status_added -gt 0 ]; then
			printf "${txtgrn}Added $__git_status_added files.\n"
		fi
		if [ $__git_status_modified -gt 0 ]; then
			printf "${txtylw}Modified $__git_status_modified files.\n"
		fi
		if [ $__git_status_renamed -gt 0 ]; then
			printf "${txtylw}Renamed $__git_status_renamed files.\n"
		fi
		if [ $__git_status_deleted -gt 0 ]; then
			printf "${txtred}Deleted $__git_status_deleted files.\n"
		fi
	else
		echo >&2 'I think this is not git directory tree.'
	fi
}

alias gs=__print_git_status
