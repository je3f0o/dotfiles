function! TrimSelection()
  " Get the start and end position of the visual selection
  let l:start_pos = getpos("'<")

  " Select the text in visual mode and yank it
  normal! gv"zy

  " Get the yanked text from register z
  let l:selected_text = getreg('z')

  " Trim leading and trailing whitespace
  let l:trimmed_text = substitute(l:selected_text, '^\s\+\|\s\+$', '', 'g')

  " Replace the selection with the trimmed text
  call setreg('z', l:trimmed_text)
  normal! gv"zP
endfunction

" Map this function to a key in visual mode
xnoremap <C-t> :<C-u>call TrimSelection()<CR>