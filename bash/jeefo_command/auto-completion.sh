
function _assign_last_jeefo_command () {
	local commands_list=$1
    local __last_command=$2
    local __index=$3

	local i=1
	local current_command prev

	for ((; i < COMP_CWORD; ++i)); do
		current_command=`compgen -W "$commands_list" -- "${COMP_WORDS[i]}"`

		if [[ $current_command ]]; then
			prev="${COMP_WORDS[i - 1]}"

			if [[ ! $prev || $prev != -* ]]; then
				eval $__index=$i
				eval $__last_command="'$current_command'"
			fi
		fi
	done
}

function _assign_last_jeefo_command_option () {
	local i=$1
	local __last_option=$2
	local current_option

	for ((; i < COMP_CWORD; ++i)); do
		current_option="${COMP_WORDS[i]}"

		if [[ "$current_option" == -* ]]; then
			eval $__last_option="'$current_option'"
		fi
	done
}

function _jeefo_command_auto_completion () {
	# Alternatively method for auto completion
	# at the top of the function to disable default
	# compopt +o default
	# and where you need filename completion, re-enable it and send empty COMPREPLY
	# compopt -o default
	# COMPREPLY=()
	# return 0

	local executable_command_name=$1
	local commands_list=`"$executable_command_name" print --available-commands true`
    local current_argument="${COMP_WORDS[COMP_CWORD]}"

	local last_command last_command_index option_type last_option available_options

	_assign_last_jeefo_command "$commands_list" last_command last_command_index

	if [[ ! -z $last_command ]]; then
		# current argument
		if [[ "$current_argument" == -* ]]; then
			available_options=`"$executable_command_name" print --available-options true --command-name "$last_command"`
			COMPREPLY=(`compgen -W "$available_options" -- "$current_argument"`)
		else
			_assign_last_jeefo_command_option $(( last_command_index + 1)) last_option

			if [[ ! -z "$last_option" ]]; then
				# Removing option prefix --
				if [[ "$last_option" == --* ]]; then
					last_option=${last_option:2}
				else
					last_option=${last_option:1}
				fi
				option_type=`"$executable_command_name" print --type true --command-name "$last_command" --option-name "$last_option"`

				# Generating specific auto completion for specific options
				case $option_type in
					Boolean)
						COMPREPLY=(`compgen -W 'true false' -- "$current_argument"`)
						;;
					FilePath)
						COMPREPLY=(`compgen -f -- "$current_argument"`)
						;;
					DirectoryPath)
						COMPREPLY=(`compgen -d -- "$current_argument"`)
						;;
				esac
			else
				available_options=`"$executable_command_name" print --available-options true --command-name "$last_command"`
				COMPREPLY=(`compgen -W "$available_options" -- "$current_argument"`)
			fi
		fi
	else
		available_options=`jeefo-dev print --available-commands true`
		COMPREPLY=(`compgen -W "$available_options" -- "$current_argument"`)
	fi

	return 0
}
