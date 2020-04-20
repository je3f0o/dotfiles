
# GNU sed
#if __is_command_exists gsed; then
	#alias sed=gsed
#fi

# List files
if is_true $__IS_MAC; then
	alias ll='ls -lhGtr'
	alias lla='ls -lhGtra'
else
	alias ll='ls -lhtr --color=auto'
	alias lla='ls -lhtra --color=auto'
fi

