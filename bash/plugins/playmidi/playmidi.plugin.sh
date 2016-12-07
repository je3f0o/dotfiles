
# install fluidsynth
# brew install fluidsynth
# wget https://dl.dropboxusercontent.com/u/8126161/GeneralUser_GS_1.47.zip
# unzip unzip GeneralUser_GS_1.47.zip
# mkdir -p /usr/local/share/fluidsynth
# mv 'GeneralUser GS 1.47/GeneralUser GS v1.47.sf2' /usr/local/share/fluidsynth

function playmidi {
	local SOUNDFONT='/usr/local/share/fluidsynth/GeneralUser GS v1.47.sf2'

	if [ -e "$SOUNDFONT" ]; then 
		for i in "$@"; do 
			if [ -e "$i" ]; then
				# TODO: add -v verbose, silent version
				#(fluidsynth -i "$SOUNDFONT" "$i" 2>&1) >/dev/null
				fluidsynth -i "$SOUNDFONT" "$i"
			else
				echo "[playmidi]: cannot find file at $i"   
				return 1
			fi  
		done 
	else
		echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
		return 1
	fi  
}
