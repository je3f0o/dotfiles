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
    let file_name_line  = getline(2)
    let updated_at_line = getline(4)

    let is_file_name_valid  = file_name_line  =~? '\* File Name\s*:.*'
    let is_updated_at_valid = updated_at_line =~? '\* Updated at\s*:.*'

    " just reminder for new line continuation
    if is_file_name_valid
      \ && is_updated_at_valid
      " Update the 'File Name' and 'Updated at' headers
      let new_file_name  = ' * File Name   : ' . expand("%:t")
      let new_updated_at = ' * Updated at  : ' . strftime("%Y-%m-%d")
      call setline(2, new_file_name)
      call setline(4, new_updated_at)
    endif
  endfunction

  function! UpdateHeaderGeneric()
    " Save cursor position:
    "let l:cursor_save = getpos('.')
    " Save window and cursor location:
    "let l:winview = winsaveview()

    silent! undojoin | call s:edit_header()
    "call feedkeys("\<C-o>\<C-o>")

    " Restore cursor position:
    "call setpos('.', l:cursor_save)
    " Restore window and cursor location:
    "call winrestview(l:winview)
  endfunction
endif

if !exists("s:is_loaded") && has("autocmd")
  " Automatically removing all trailing whitespace
  autocmd BufWritePre * %s/\s\+$//e

  " Update header
	autocmd BufNewFile *.js                        call PreHeaderJavascript()
	autocmd BufNewFile *.c,*.rs                    call PreHeaderGeneric()
  autocmd BufWritePre,FileWritePre *.c,*.rs,*.js call UpdateHeaderGeneric()

  let s:is_loaded = 1
endif