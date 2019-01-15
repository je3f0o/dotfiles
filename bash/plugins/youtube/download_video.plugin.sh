# youtube-dl -F url
# Then choose the best one

# Example : youtube-dl -f 11 url

# Example from webupd8

# youtube-dl -F http://www.youtube.com/watch?v=3JZ_D3ELwOQ
# sample output:

# [youtube] Setting language
# [youtube] 3JZ_D3ELwOQ: Downloading webpage
# [youtube] 3JZ_D3ELwOQ: Downloading video info webpage
# [youtube] 3JZ_D3ELwOQ: Extracting video information
# [info] Available formats for 3JZ_D3ELwOQ:
# format code extension resolution  note 
# 171         webm      audio only  DASH webm audio , audio@ 48k (worst)
# 140         m4a       audio only  DASH audio , audio@128k
# 160         mp4       192p        DASH video 
# 133         mp4       240p        DASH video 
# 134         mp4       360p        DASH video 
# 135         mp4       480p        DASH video 
# 136         mp4       720p        DASH video 
# 137         mp4       1080p       DASH video 
# 17          3gp       176x144     
# 36          3gp       320x240     
# 5           flv       400x240     
# 43          webm      640x360     
# 18          mp4       640x360     
# 22          mp4       1280x720    (best)
# You can choose best and type

# youtube-dl -f 22 http://www.youtube.com/watch?v=3JZ_D3ELwOQ
# To get the best video quality (1080p DASH - format "137") and best audio quality (DASH audio - format "140"), you must use the following command:

# youtube-dl -f 137+140 http://www.youtube.com/watch?v=3JZ_D3ELwOQ

function youtube-dl-video {
	youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --restrict-filenames $@
}
