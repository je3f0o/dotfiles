
# IIFE (Immediately-Invoked Function Expression) 
#__IIFE() {
#} && __IIFE; unset -f __IIFE

function __autoloader {
	local suffix=''
	if [ ! -z $2 ]; then
		suffix=".$2"
	fi

	local PLUGINS=$(find ~/.bash/$1 -iname "*${suffix}.sh")

	for file in $PLUGINS; do
		source "${file}"
	done
}

__autoloader libs lib
__autoloader aliases
__autoloader plugins plugin
