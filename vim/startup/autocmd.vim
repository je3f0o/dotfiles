
if has("autocmd")
	autocmd BufNewFile *.js :call PreHeaderJavascript()

	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
endif
