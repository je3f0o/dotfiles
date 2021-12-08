
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

function ssh_keygen {
  mkdir -p .ssh & ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
}

function ssh_copy_id {
	if [ -z $1 ]; then
		echo 'argv1 => source host required.'
		echo 'argv2 => destination host required.'
		return 1
	fi
	if [ -z $2 ]; then
		echo 'argv2 = destination host required.'
		return 1
	fi
  local src_host="$1"
  local dst_host="$1"

  ssh "@dst" 'mkdir -p ~/.ssh' && \
    scp "@$src_host:~/.ssh/id_rsa.pub" "@dst_host:~/.ssh/authorized_keys"
}