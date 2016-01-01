
function is_true {
	case $1 in
		(true)     return 0;;
		(''|false) return 1;;
	esac

	echo "I just dodged a bullet"
	echo "$1"
	return 1
}
