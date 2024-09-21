
# brew install yt-dlp
# youtube-dl params

function youtube-dl-audio {
  yt-dlp -x \
    --no-write-thumbnail \
    --embed-thumbnail \
    --audio-format mp3 -o "%(title)s.%(ext)s" $@
}