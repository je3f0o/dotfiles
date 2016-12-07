
if ! exists("*JsBeautify")
	function s:JsBeautify() range
		let type = (&filetype ==# 'javascript') ? 'js' : &filetype

		let cmd = ['!uglifyjs -b']

		execute a:firstline . ',' . a:lastline . join(cmd)
	endfunction
endif

augroup jsbeautify
	autocmd!
	autocmd FileType html,css,javascript,json
		\ command! -bar -nargs=0 -buffer -range=% JsBeautify <line1>,<line2>call s:JsBeautify()
augroup END
