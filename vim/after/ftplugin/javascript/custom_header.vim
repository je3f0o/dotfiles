
if !exists("*PreHeaderJavascript")
	let s:filename=expand("<sfile>:h") . "/js_header.txt"

	function! PreHeaderJavascript()
		exec "source " . s:filename
		exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
		exec "3g/Created at\\s*:.*/s//Created at  : " . strftime("%Y-%m-%d")
		normal G
	endfunction
endif

" TODO: if you can clear last 2 jump lists
if !exists("*UpdateHeaderJavascript")
	function! s:edit_header()
		normal ma
		silent! exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
		silent! exec "4g/Updated at\\s*:.*/s//Updated at  : " . strftime("%Y-%m-%d")
		normal `azz
	endfunction

	function! UpdateHeaderJavascript()
		silent! undojoin | call s:edit_header()
	endfunction
endif

if has("autocmd")
	autocmd BufWritePre,FileWritePre *.js call UpdateHeaderJavascript()
endif

