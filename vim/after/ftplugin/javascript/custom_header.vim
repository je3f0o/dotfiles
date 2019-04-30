
if !exists("*PreHeaderJavascript")
	let s:filename=expand("<sfile>:h") . "/js_header.txt"

	function! PreHeaderJavascript()
		exec "source " . s:filename
		exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
		exec "3g/Created at\\s*:.*/s//Created at  : " . strftime("%Y-%m-%d")
		normal G
	endfunction
endif

if !exists("*UpdateHeaderJavascript")
	function! s:edit_header()
		silent! exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
		silent! exec "4g/Updated at\\s*:.*/s//Updated at  : " . strftime("%Y-%m-%d")
	endfunction

	function! UpdateHeaderJavascript()
		" Save window and cursor location:
		let l:winview = winsaveview()

		silent! undojoin | call s:edit_header()

		" Restore window and cursor location:
		call winrestview(l:winview)
	endfunction
endif

if has("autocmd")
    " Automatically removing all trailing whitespace
    autocmd BufWritePre * %s/\s\+$//e

    " Update header
	autocmd BufWritePre,FileWritePre *.js call UpdateHeaderJavascript()
endif

