#!/bin/bash

source ~/.bash/vim.sh

function lowercase {
	sed -e 's/\(.*\)/\L\1/' <<< ${1}
}

TYPE="Controller"
TYPE_LOWERCASE=`lowercase $TYPE`.
TYPE_DIR="contrrollers"
OPT_PATH=

function usage {
echo "	Usage: requirejs <options>
	Create a simple blank template 'RequireJS + AngularJS' file.

	OPTIONS:
	-h	Show this message
	-c	Controller
	-f	Filter
	-d	Directive
	-s	Service
	-p	Path for working directory
"
}

# Parsing argument options
while getopts ":hfsdp:" OPTION; do
	case $OPTION in
	f)
		TYPE="Filter"
		TYPE_DIR="filters"
		TYPE_LOWERCASE=`lowercase $TYPE`.
		;;
	s)
		TYPE="Service"
		TYPE_DIR="services"
		TYPE_LOWERCASE=
		;;
	d)
		TYPE="Directive"
		TYPE_DIR="directives"
		TYPE_LOWERCASE=`lowercase $TYPE`.
		;;
	p)
		OPT_PATH=$OPTARG
		;;
	\? | h)
		usage
		exit 1
		;;
	esac
done

# This tells getopts to move on to the next argument
shift $((OPTIND-1))  

# Error checking ...
if [ -z $1 ]; then
	echo "ERROR : Function name required"
	usage
	exit 
fi

function_name=`sed -e 's/^\([a-z]\)/\U\1/' <<< "${1}${TYPE}"`
current_dir=`dirname $BASH_SOURCE`
template_type="${TYPE_LOWERCASE}tmpl.js"

template_path="${current_dir}/requirejs.${template_type}" 

filename=`sed -e "s/\([A-Z]\)/_\L\1/g" -e "s/^_//" <<< $function_name`.js
filepath="${TYPE_DIR}/${filename}"

if [ ! -z $OPT_PATH ]; then
	filepath="${OPT_PATH}/${filepath}"
fi

if [ -e $filepath ]; then
	echo "Sorry this file is already exist!"
	echo $filepath
	exit 1
fi

sed -e "s/OBJECT_NAME/${function_name}/g" < $template_path > $filepath
vim $filepath
