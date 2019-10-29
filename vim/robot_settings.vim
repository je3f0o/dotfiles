
setlocal comments-=://
setlocal nofoldenable    " disable folding
setlocal nocin nosi inde=
"setlocal noautoindent

silent! iunmap <buffer> jj
silent! iunmap <buffer> '
silent! iunmap <buffer> "
silent! iunmap <buffer> {
silent! iunmap <buffer> (
silent! iunmap <buffer> [
"colorscheme slate
"hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
"hi CursorLineNr ctermfg=110
"hi CursorColumn cterm=NONE ctermbg=234 ctermfg=NONE

hi Comment cterm=NONE

function! ToggleImap(name)
	if a:name == "en"
		iunmap =
		iunmap Й
		iunmap йй
		iunmap +
		iunmap Ю
		iunmap юю
	else
		imap = ы
		imap Й э
		imap йй е
		imap + '
		imap Ю /
		imap юю Э
	endif
endfunction

imap <F3> <ESC>;call ToggleImap("mn")<CR>a
imap <F4> <ESC>;call ToggleImap("en")<CR>a





