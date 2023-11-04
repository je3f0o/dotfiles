if !exists("*PreHeaderJavascript")
	function! PreHeaderJavascript()
    let l:filetype = &filetype
    let s:filename = expand("~/.vim/after/ftplugin/javascript/js_header.txt")
    echo "source " . s:filename
    if filereadable(s:filename)
      exec "source " . s:filename
      exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
      exec "3g/Created at\\s*:.*/s//Created at  : " . strftime("%Y-%m-%d")
      normal G
    else
      echo "Header not inserted: " . s:filename
    endif
	endfunction
endif

if !exists("*UpdateHeaderJavascript")
	function! s:edit_js_header()
		silent! exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
		silent! exec "4g/Updated at\\s*:.*/s//Updated at  : " . strftime("%Y-%m-%d")
	endfunction

	function! UpdateHeaderJavascript()
		" Save window and cursor location:
    let l:cursor_save = getpos('.')
		"let l:winview = winsaveview()

		silent! undojoin | call s:edit_js_header()

		" Restore window and cursor location:
    call setpos('.', l:cursor_save)
		"call winrestview(l:winview)
	endfunction
endif

if !exists("*PreHeaderGeneric")
  function! PreHeaderGeneric()
    let l:filetype = &filetype
    let s:filename = expand("~/.vim/plugin/c_style_header.txt")
    if filereadable(s:filename)
      exec "source " . s:filename
      exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
      exec "3g/Created at\\s*:.*/s//Created at  : " . strftime("%Y-%m-%d")
      normal G
    else
      echo "Header not inserted: " . s:filename
    endif
  endfunction
endif

if !exists("*UpdateHeaderGeneric")
  function! s:edit_header()
    let l:filetype = &filetype
    if l:filetype ==# 'c' || l:filetype ==# 'rust' " Add more filetypes here as needed
      let s:filename = expand("~/.vim/plugin/c_style_header.txt")
      if filereadable(s:filename)
        silent! exec "2g/File Name\\s*:.*/s//File Name   : " . expand("%:t")
        silent! exec "4g/Updated at\\s*:.*/s//Updated at  : " . strftime("%Y-%m-%d")
      else
        echo "Header not updated: " . s:filename
      endif
    endif
  endfunction

  function! UpdateHeaderGeneric()
    " Save cursor position:
    let l:cursor_save = getpos('.')

    " Save window and cursor location:
    "let l:winview = winsaveview()

    silent! undojoin | call s:edit_header()

    " Restore cursor position:
    call setpos('.', l:cursor_save)

    " Restore window and cursor location:
    "call winrestview(l:winview)
  endfunction
endif

if !exists("s:is_loaded") && has("autocmd")
  " Automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " Update header
	autocmd BufNewFile *.c,*.rs       :call PreHeaderGeneric()
  autocmd BufWritePre,FileWritePre * call UpdateHeaderGeneric()

  " Update header
	autocmd BufNewFile *.js               call PreHeaderJavascript()
	autocmd BufWritePre,FileWritePre *.js call UpdateHeaderJavascript()

  let s:is_loaded = 1
endif