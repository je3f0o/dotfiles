
" Book mode
if !exists("*BookMode")
	function BookMode()
		set formatoptions+=w
		set colorcolumn=80
		set textwidth=80
		hi ColorColumn ctermfg=123 ctermbg=234
	endfunction
endif

" Facebook mode
if !exists("*FacebookMode")
	function FacebookMode()
		set formatoptions+=w
		set colorcolumn=64
		set textwidth=64
		hi ColorColumn ctermfg=123 ctermbg=234
		set dictionary+=~/mongolian_words
	endfunction
endif

if exists('facebook')
	call FacebookMode()
else
	set formatoptions+=w
	set colorcolumn=80
	set textwidth=80
	hi ColorColumn ctermfg=123 ctermbg=234
endif
