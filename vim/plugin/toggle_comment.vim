
let s:c_style_inline_comment = '\/\/'

function! s:ToggleCssComment(start_line, end_line)
  let start_line = a:start_line
  let end_line = a:end_line

  let lines = getline(start_line, end_line)
  let is_commented = 1

  " Check if all lines are commented
  for line in lines
    if line !~ '^\s*/\*'
      let is_commented = 0
      break
    endif
  endfor

  if is_commented
    " Uncomment all lines
    execute start_line . ',' . end_line . 's#^\(\s*\)/\*\s*#\1#'
    execute start_line . ',' . end_line . 's#\s*\*/##'
  else
    " Comment all lines
    execute start_line . ',' . end_line . 's#^\(\s*\)#\1/* #'
    execute start_line . ',' . end_line . 's#$# */#'
  endif
endfunction

let s:comment_map = {
  \   "c": s:c_style_inline_comment,
  \   "cpp": s:c_style_inline_comment,
  \   "go": s:c_style_inline_comment,
  \   "kotlin": s:c_style_inline_comment,
  \   "glsl": s:c_style_inline_comment,
  \   "sass": s:c_style_inline_comment,
  \   "scss": s:c_style_inline_comment,
  \   "java": s:c_style_inline_comment,
  \   "javascript": s:c_style_inline_comment,
  \   "javascriptreact": s:c_style_inline_comment,
  \   "typescript": s:c_style_inline_comment,
  \   "typescriptreact": s:c_style_inline_comment,
  \   "php": s:c_style_inline_comment,
  \   "python": '#',
  \   "ruby": '#',
  \   "sh": '#',
  \   "conf": '#',
  \   "toml": '#',
  \   "yaml": '#',
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
  elseif &filetype == 'css'
    call s:ToggleCssComment(a:firstline, a:lastline)
  else
    echo 'No comment map found for filetype: ' . &filetype
  end
endfunction

command! -bar -range ToggleComment <line1>,<line2>call s:ToggleComment()