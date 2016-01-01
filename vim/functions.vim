
"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
"
"function! s:align()
"	let p = '^\s*|\s.*\s|\s*$'
"	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"		Tabularize/|/l1
"		normal! 0
"		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"	endif
"endfunction


" Automatically close brackets
if !exists("*AutoCloseBrackets")
	"function AutoPair(pair)
	"	echo pair
	"endfunction
	function AutoCloseBrackets()
		inoremap <buffer> ' ''<ESC>i
		inoremap <buffer> " ""<ESC>i
		inoremap <buffer> { {<CR>}<C-c>O
		inoremap <buffer> ( ()<left>
		inoremap <buffer> [ []<left>
	endfunction
endif

if !exists("*CycleLineNumbers")
	let s:state = 2
	set number
	set relativenumber

	function CycleLineNumbers()
		if (s:state == 1)
			set nu
			set rnu
			let s:state = 2
		elseif (s:state == 2)
			set nonu
			set rnu
			let s:state = 3
		else
			set nornu
			set nu
			let s:state = 1
		endif
	endfunction
endif

if !exists("*FixLastSpellingError")
	function FixLastSpellingError()
		normal! mm[s1z=`m
	endfunction
endif
