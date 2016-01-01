
if is_true $__IS_LINUX; then
	function ls_dot_underscore_files {
		find . -name '._*' -exec ls --color=auto {} \;
	}

	function ls_ds_store_files {
		find . -name '.DS_Store' -exec ls {} \;
	}

	function clean_dot_underscore_files {
		find . -name '._*' -exec rm -v {} \;
		find . -name '.DS_Store' -exec rm -v {} \;
	}
fi
