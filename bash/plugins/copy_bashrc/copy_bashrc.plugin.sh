
function copy_bashrc {
	local bashrc='bashrc'
	if [ -z $1 ]; then
		echo 'argv1 => hostname is required.'
		return 1
	fi
	if [[ $2 == 'mac' ]]; then
		bashrc='bash_profile'
	fi

	local DESTINATION='.bash'
	local HOST="jeefo@$1"
	local TARNAME='bashrc.tar.gz'

	tar chzf - -C ~/.bash . | ssh "$HOST" "cat > $TARNAME"
	ssh "${HOST}" bash -c "'
		mkdir -p $DESTINATION
		tar xzf $TARNAME -C $DESTINATION
		rm -rf $TARNAME
		ln -sf ~/$DESTINATION/bashrc ~/.$bashrc
	'"
}
