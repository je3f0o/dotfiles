
# FIXME: i need a lot of update, make sure escape quotes
function ternary {
	# Make a assert
	if [ "$1" ] ; then
		echo "$2"
	else
		echo "$3"
	fi	
}
