
function __git_branch {
	if __is_git; then
		__parse_git_status

		printf " ${txtrst}git (${bldgrn}%s${txtrst}) branch\n" $(__get_current_git_branch_name)

		if [ $__git_status_changed -eq 0 ]; then
			local status='⚡ '

			if [ $__git_status_added -gt 0 ]; then
				status+=" ${txtgrn}[${__git_status_added} added]"
			fi
			if [ $__git_status_modified -gt 0 ]; then
				status+=" ${txtylw}[${__git_status_modified} modified]"
			fi
			if [ $__git_status_deleted -gt 0 ]; then
				status+=" ${txtred}[${__git_status_deleted} deleted]"
			fi

			printf "${status}\n"
		else
			printf "${txtcyn}☁ Happy cloud :)"
		fi
	fi
}

function print_pre_prompt {
	local PS1_PATH
	local PS1_GIT_STATUS=''

	auto-rename-tmux-window

	if [[ "$PWD"/ = "$HOME"/* ]]; then
		PS1_PATH=\~${PWD#$HOME}
	else
		PS1_PATH=$PWD
	fi

	if __is_git; then
		PS1_GIT_STATUS=" git ($(__get_current_git_branch_name)) "

		if __is_git_changed; then
			PS1_GIT_STATUS+="⚡"
		else
			PS1_GIT_STATUS+="☁"
		fi
	fi

	# "I'm in ".length === 7
	local right_offset=40 #$(($COLUMNS - ${#PS1_GIT_STATUS}))

	printf "${txtgrn}ツ ${txtrst}in ${txtblu}%s${txtgrn}%s\n" "$PS1_PATH" "$PS1_GIT_STATUS"
}

PROMPT_COMMAND=print_pre_prompt
PS1="\[${bldpur}\]➜ \[${txtrst}\]"

