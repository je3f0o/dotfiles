#!/bin/bash

if [ -z $1 ]; then
	echo "Function name required"
	echo "Usage: ${0} <Filename>"
else
	function_name=`sed -e 's/^\([a-z]\)/\U\1/' <<< $1`
	current_dir=`dirname $BASH_SOURCE`
	template_path="${current_dir}/requirejs.tmpl.js" 

	filepath=`sed -e "s/\([A-Z]\)/_\L\1/g" -e "s/^_//" <<< $function_name`.js
	if [ ! -z $2 ]; then
		filepath="${2}/${filepath}"
	fi
	
	if [ -e $filepath ]; then
		echo "Sorry this file is already exist!"
		echo $filepath
	else
		sed -e "s/FUNCTION_NAME/${function_name}/g" < $template_path > $filepath
		vim $filepath
	fi
fi
