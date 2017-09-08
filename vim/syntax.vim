

if !exists("*SetJeefoTemplate")
	function! SetJeefoTemplate()
		set filetype=jeefo_template
		source ~/.vim/syntax/jt.vim
	endfunction
endif

autocmd BufNewFile,BufRead *.jt call SetJeefoTemplate()


if !exists("*SetJeefoJavascript")
	function! SetJeefoJavascript()
		set filetype=javascript
		let b:syntastic_skip_checks = 1
		source ~/.vim/syntax/jjs.vim
	endfunction
endif

autocmd BufNewFile,BufRead *.jjs call SetJeefoJavascript()


if !exists("*SetMJS")
	function! SetMJS()
		set filetype=mjs
		source ~/.vim/syntax/mjs.vim
	endfunction
endif

autocmd BufNewFile,BufRead *.mjs call SetMJS()
