
let s:c_style_inline_comment = '\/\/'

let s:comment_map = {
  \   "c": s:c_style_inline_comment,
  \   "cpp": s:c_style_inline_comment,
  \   "go": s:c_style_inline_comment,
  \   "kotlin": s:c_style_inline_comment,
  \   "glsl": s:c_style_inline_comment,
  \   "sass": s:c_style_inline_comment,
  \   "java": s:c_style_inline_comment,
  \   "javascript": s:c_style_inline_comment,
  \   "javascriptreact": s:c_style_inline_comment,
  \   "php": s:c_style_inline_comment,
  \   "python": '#',
  \   "ruby": '#',
  \   "sh": '#',
  \   "conf": '#',
  \   "toml": '#',
  \   "vim": '"',
  \   "rust": s:c_style_inline_comment,
  \ }

function! s:ToggleComment() range
  if has_key(s:comment_map, &filetype)
    let comment = s:comment_map[&filetype]
    let firstline = getline(a:firstline)
    let indent = matchstr(firstline, '^\s*')
    let _range = a:firstline . ',' . a:lastline

    if firstline =~ '^' . indent . comment
      execute _range . 's/^' . indent . comment . "/" . indent . '/'
    else
      execute _range . 's/^' . indent . '/' . indent . comment . '/'
    end
  else
    echo 'No comment map found for filetype: ' . &filetype
  end
endfunction

command! -bar -range ToggleComment <line1>,<line2>call s:ToggleComment()