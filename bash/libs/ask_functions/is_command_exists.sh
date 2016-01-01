
#command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
#type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
#hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

function __is_command_exists {
	command -v $1 >/dev/null 2>&1
}
