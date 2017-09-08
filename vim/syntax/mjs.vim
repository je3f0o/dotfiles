" Vim syntax file
" Language: Mongol Javascript
" Maintainer: je3f0o
" Credits: je3f0o
" Filenames: *.mjs

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'mjs'
endif


syn keyword MJS_label    хувьсагч ХХ
syn keyword MJS_keyword  бол
syn keyword MJS_function ажил


syn match MJS_conditional "хэрвээ"
syn match MJS_conditional "эсвэл"
syn match MJS_conditional "тэнцүү"

syn match MJS_boolean "үнэн"
syn match MJS_boolean "худлаа"

syn region MJS_comment start="\(^\|\s\)Сэтгэгдэл\(\s\|$\)" end="\(^\|\s\)Сэтгэгдэл\.\(\s\|$\)"
syn region MJS_comment start="\(^\|\s\)С\(\s\|$\)"         end="\(^\|\s\)С\.\(\s\|$\)"

syn match MJS_string_delimiter "\(,\|\.\)$" contained

syn region MJS_string start="\(^\|\s\)Текст\(\s\|$\)" end="\(^\|\s\)Текст\(\s\|$\)"
syn region MJS_string start="\(^\|\s\)ТТ\(\s\|$\)"    end="\(^\|\s\)ТТ\(,\|\.\|\s\|$\)" contains=MJS_string_delimiter keepend

hi def link MJS_comment_short MJS_comment

hi def link MJS_label       Label
hi def link MJS_string      String
hi def link MJS_keyword     Keyword
hi def link MJS_boolean     Boolean
hi def link MJS_comment     Comment
hi def link MJS_function    Function
hi def link MJS_conditional Conditional


let b:current_syntax = "mjs"
if main_syntax == "mjs"
  unlet main_syntax
endif
