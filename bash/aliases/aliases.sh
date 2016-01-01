
# GNU sed
if __is_command_exists gsed; then
	alias sed=gsed
fi

# List files
if [ $__IS_MAC ]; then
	alias ll='ls -lhG'
	alias lla='ls -lahG'
else
	alias ll='ls -lh --color=auto'
	alias lla='ls -lah --color=auto'
fi
