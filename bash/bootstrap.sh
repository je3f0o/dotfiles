
if [[ $OSTYPE == 'darwin'* ]]; then
	__IS_MAC=true
	__BASHRC='bash_profile'
else
	__IS_LINUX=true
	__BASHRC='bashrc'
fi

function source_relative {
	local dir=$(dirname ${BASH_SOURCE[1]})
	source "${dir}/${1}"
}

source ~/.bash/autoloader.sh

# Load ~/.bash
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.bash/{colors,exports,aliases,functions}.sh; do
	[ -r "$file" ] && source "$file"
done
unset file

source ~/.bash/themes/jeefo.theme.sh
source ~/.bash/paths.sh
