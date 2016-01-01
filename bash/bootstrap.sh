
if [[ $OSTYPE == 'darwin'* ]]; then
	__IS_MAC=true
	__BASHRC='bash_profile'
else
	__IS_MAC=false
	__BASHRC='bashrc'
fi

source ~/.bash/autoloader.sh

# Load ~/.bash
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.bash/{colors,exports,aliases,functions}.sh; do
	[ -r "$file" ] && source "$file"
done
unset file

source ~/.bash/themes/jeefo.theme.sh
source ~/.bash/paths.sh
