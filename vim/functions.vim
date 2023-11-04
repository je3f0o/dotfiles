
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
if !exists("*EnableAutoCloseCurlyBrackets")
	function EnableAutoCloseCurlyBrackets()
		inoremap <buffer> { {}<C-c>i
	endfunction
endif
if !exists("*DisableAutoCloseCurlyBrackets")
	function DisableAutoCloseCurlyBrackets()
		inoremap <buffer> { {
	endfunction
endif

if !exists("*MakeFoldMarker")
	function MakeFoldMarker()
		call DisableAutoCloseCurlyBrackets()
		normal a{{{
		call EnableAutoCloseCurlyBrackets()
	endfunction
endif

" Automatically close brackets
if !exists("*AutoCloseBrackets")
	"function AutoPair(pair)
	"	echo pair
	"endfunction
	function AutoCloseBrackets()
		inoremap <buffer> ' ''<ESC>i
		inoremap <buffer> " ""<ESC>i
		inoremap <buffer> ( ()<left>
		inoremap <buffer> [ []<left>
		call EnableAutoCloseCurlyBrackets()
	endfunction
endif

if !exists("*CycleLineNumbers")
	let s:state = 2
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

if !exists("*Retab2")
	function Retab2()
		exec ':%s;^\(\s\+\);\=repeat(" ", len(submatch(0))/2);g'
    call TabConfigs()
	endfunction
endif

if !exists("*RemoveHashComments")
	function RemoveHashComments()
		exec 'g/^\(#\|$\)/d'
	endfunction
endif

if !exists("TabConfigs")
  function TabConfigs()
    set autoindent
    set smarttab
    set smartindent
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    " On pressing tab, insert spaces or tab (noexpandtab = tab, expandtab = spaces)
    " after change the config use `:retab` to replace tabs
    set expandtab
  endfunction

  call TabConfigs()
endif