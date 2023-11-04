let s:find    = ""
let s:replace = ""

function! QueryReplaceRepeat()
  let _range = a:firstline . ',' . a:lastline
  execute _range.'s@'.s:find.'@'.s:replace.'@g'
  call repeat#set("\<Plug>(QueryReplaceRepeat)")
  redraw
endfunction

function! s:QueryReplace() range
  let s:find    = input("Find: ")
  let s:replace = input("Replace: ")

  let _range = a:firstline . ',' . a:lastline
  execute _range.'call QueryReplaceRepeat()'
endfunction

nmap <Plug>(QueryReplaceRepeat) ;<C-U>call QueryReplaceRepeat()<CR>

command! -bar -range QueryReplace <line1>,<line2>call s:QueryReplace()