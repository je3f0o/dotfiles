
syn clear   javaScriptGlobal
syn clear   javaScriptGLOBALS
syn clear   javaScriptComment
syn clear   javaScriptCommentTodo
syn clear   javaScriptStringD
syn clear   javaScriptStringS

syn keyword javaScriptGlobal		   self window

syn match   javaScriptGLOBALS	       "\<[A-Z_][A-Z_0-9]\+\>"

syn match   javaScriptDot	           +\.+
syn match   javaScriptComma	           +,+

syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD NOTE contained
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo   extend

" ES6 template string
syn match  javaScriptTemplateDelim    "\${\|}" contained
syn region javaScriptTemplateVar      start=+${+ end=+}+  contains=javaScriptTemplateDelim keepend
syn region javaScriptTemplateString   start=+`+  skip=+\\\\\|\\`+ end=+`+  contains=javaScriptTemplateVar,javaScriptLineComment    extend

syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	extend
"contains=@htmlPreproc
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	extend

hi link javaScriptStringS        String
hi link javaScriptStringD        String
hi link javaScriptTemplateString String

hi javaScriptTemplateDelim ctermfg=40 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi javaScriptTemplateVar   ctermfg=4  ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
