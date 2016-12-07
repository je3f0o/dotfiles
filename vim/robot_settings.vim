
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
		imap / /
		imap - -
		imap _ _
		imap = =
	else
		imap Ю /
		imap е э
		imap Е Э
		imap = ы
	endif
endfunction

imap <F3> <ESC>;call ToggleImap("mn")<CR>a
imap <F4> <ESC>;call ToggleImap("en")<CR>a





