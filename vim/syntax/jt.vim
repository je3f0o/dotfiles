" Vim syntax file
" Language: jeefo_template
" Maintainer: je3f0o
" Credits: je3f0o
" Filenames: *.jt

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'jeefo_template'
endif

unlet! b:current_syntax
syntax include @JeefoTemplateCSS syntax/css.vim contained

syn match   JeefoTemplateTag  "\s\?\w\(\w\|\-\)*"  nextgroup=JeefoTemplateClassChar,JeefoTemplateIdChar

syn match   JeefoTemplateClass     "\w\(\w\|-\)*"  contained
syn match   JeefoTemplateClassChar "\."            nextgroup=JeefoTemplateClass

syn match   JeefoTemplateId     "\w\(\w\|-\)*"  contained  contains=JeefoTemplateString
syn match   JeefoTemplateIdChar "#"             nextgroup=JeefoTemplateId

syn match   JeefoTemplateOperator ">\|+\|\^"

syn cluster JeefoTemplateComponent  contains=JeefoTemplateClassChar,JeefoTemplateClass,JeefoTemplateIdChar,JeefoTemplateId

syn region  JeefoTemplateContent	start="("  end=")"  keepend contains=JeefoTemplateString

syn region  JeefoTemplateComment	start="{"  end="}"  keepend

syn region  JeefoTemplateString	    start=+'+  skip=+\\'+  end=+'+  contained keepend extend
syn region  JeefoTemplateString	    start=+"+  skip=+\\"+  end=+"+  contained keepend extend

syn match   JeefoTemplateAttributesParens     "\[\|]" contained
syn match   JeefoTemplateAttributeDelimiter   ","     contained
syn match   JeefoTemplateAttributeAssignment  "="     contained

syn region  JeefoTemplateAttributes    start="\["  end="]"  keepend  contains=JeefoTemplateString,JeefoTemplateAttributesParens,JeefoTemplateAttributeDelimiter,JeefoTemplateAttributeAssignment,JeefoTemplateStyleAttribute


" Style attribute
syn region  JeefoTemplateStyleAttribute	 start=+style\s*=\s*'+  end=+'+  keepend  contained  contains=css.*Prop,cssValue.*
syn region  JeefoTemplateStyleAttribute	 start=+style\s*=\s*"+  end=+"+  keepend  contained  contains=css.*Prop,cssValue.*


hi def link JeefoTemplateComment   Comment
hi def link JeefoTemplateString    String

hi JeefoTemplateTag                   ctermfg=125
hi JeefoTemplateId                    ctermfg=2
hi JeefoTemplateIdChar                ctermfg=99
hi JeefoTemplateClass                 ctermfg=111
hi JeefoTemplateClassChar             ctermfg=12
hi JeefoTemplateOperator              ctermfg=209
"hi JeefoTemplateAttributes            ctermfg=188
"hi JeefoTemplateAttributes            ctermfg=5
hi JeefoTemplateAttributesParens      ctermfg=40
hi JeefoTemplateAttributeAssignment   ctermfg=4
hi JeefoTemplateAttributeDelimiter    ctermfg=1



call css_color#init('css', 'extended', 'JeefoTemplateStyleAttribute')

let b:current_syntax = "jeefo_template"
if main_syntax == "jeefo_template"
  unlet main_syntax
endif
