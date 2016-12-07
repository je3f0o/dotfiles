
function ssh_tunnel {
	if [ -z $1 ]; then
		echo 'argv1 => ssh host is required.'
		return 1
	fi
	if [ -z $2 ]; then
		echo 'argv2 => ssh tunnel port number is required.'
		return 1
	fi
	local host="$1"
	local port="$2"

	ssh -D "$port" -N "$host"
}
