
if [ $__IS_MAC ]; then
	# List only directories
	function lld {
		ls -lh $@ | grep '^d'
	}
	function llda {
		ls -lah $@ | grep '^d'
	}

	# List only directories
	function llf {
		ls -lh $@ | grep --color=never '^[^d]'
	}
	function llfa {
		ls -lah $@ | grep --color=never '^[^d]'
	}
fi
