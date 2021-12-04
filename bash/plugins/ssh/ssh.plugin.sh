
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

function ssh_copy_id {
    echo "$ cat ~/.ssh/id_rsa.pub | \
            ssh user@remote-host 'cat >> ~/.ssh/authorized_keys'"
}