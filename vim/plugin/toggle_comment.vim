
let s:c_style_inline_comment = '\/\/'

let s:comment_map = {
  \   "c": s:c_style_inline_comment,
  \   "cpp": s:c_style_inline_comment,
  \   "java": s:c_style_inline_comment,
  \   "javascript": s:c_style_inline_comment,
  \   "php": s:c_style_inline_comment,
  \   "python": '#',
  \   "ruby": '#',
  \   "sh": '#',
  \   "conf": '#',
  \   "vim": '"',
  \ }

function! s:ToggleComment() range
  if has_key(s:comment_map, &filetype)
    let comment = s:comment_map[&filetype]
    let firstline = getline(a:firstline)
    let _range = a:firstline . ',' . a:lastline

    if firstline =~ '^\s*' . comment
      execute _range . 's/\(\s*\)' . comment . '/\1/'
    else
      execute _range . 's/\(\s*\)/\1' . comment . '/'
    end
  else
    echo 'No comment map found for filetype: ' . &filetype
  end
endfunction

command! -bar -range ToggleComment <line1>,<line2>call s:ToggleComment()