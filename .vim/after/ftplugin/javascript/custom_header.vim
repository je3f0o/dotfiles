
let s:filename=expand("<sfile>:h") . "/js_header.txt"

if !exists("*PreHeaderJavascript")
	function PreHeaderJavascript()
		exec "source " . s:filename
		exec "1,11g/File Name *:.*/s//File Name  : " . expand("%:t")
		exec "1,11g/Created at :.*/s//Created at : " . strftime("%Y-%m-%d")
		exec "1,11g/END/s///"
	endfunction
endif

if has("autocmd")
	autocmd BufWritePre,FileWritePre *.js exec "normal ma"
	autocmd BufWritePre,FileWritePre *.js silent! exec "1,9g/Updated at :.*/s//Updated at : " . strftime("%Y-%m-%d")
	autocmd BufWritePre,FileWritePost *.js exec "normal `azz"
endif
