

function mychmod {
	local started_at=$(date +%s);
	IFS=$'\n';

	for target in $(find "${1-.}" -name '*'); do
		if [ -f $target ]; then
			chmod 644 $target
		elif [ -d $target ]; then
			chmod 755 $target
		fi
	done

	local finished_at=$(date +%s);
	echo $((finished_at - started_at)) | awk '{printf "Total time %02d:%02d\n", int($1/60), int($1%60)}'
}
