

function convert_mp3 {
	local filename="${1%.*}".mp3
	#echo $filename
	#ffmpeg "$filename" -i "$1" -codec:a libmp3lame -qscale:a 1
	ffmpeg -i "$1" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$filename"
}
