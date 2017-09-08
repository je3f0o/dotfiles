
function my_cowsay {
	local range=4
	local number=$(($RANDOM % $range))
	local program=$(ternary $1 "echo $1" "fortune")

	case $number in
		0)
			cow="small"
			;;
		1)
			cow="tux"
			;;
		2)
			cow="koala"
			;;
		3)
			cow="moose"
			;;
	esac

	range=2
	number=$(($RANDOM % $range))
	case $number in
		0)
			command="cowsay"
			;;
		1)
			command="cowthink"
			;;
	esac

	eval "$program" | $command -f $cow | lolcat
}

if [ "$MY_COWSAY_START" = true ]; then
	my_cowsay
fi
