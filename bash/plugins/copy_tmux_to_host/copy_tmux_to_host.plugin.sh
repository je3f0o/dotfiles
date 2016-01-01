
function copy_tmux_to_host {
	if [ -z "${1}" ]; then
		echo 'argv1 => hostname is required.'
		return 1
	fi

	local HOST="jeefo@${1}"

	local TMUX_DIR=/tmp/.tmux
	mkdir -p "${TMUX_DIR}"
	
	pushd "${TMUX_DIR}" > /dev/null

	infocmp xterm-256color-italic > xterm-256color-italic.terminfo
	sed -e "/mouse/Id" ~/.tmux.conf > .tmux.conf
	scp xterm-256color-italic.terminfo .tmux.conf "${HOST}:"
	# On the remote machine
	ssh "${HOST}" 'tic xterm-256color-italic.terminfo'

	popd > /dev/null

	rm "${TMUX_DIR}"
}
