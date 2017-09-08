
syn clear   javaScriptGlobal
syn clear   javaScriptGLOBALS
syn clear   javaScriptComment
syn clear   javaScriptCommentTodo
syn clear   javaScriptStringD
syn clear   javaScriptStringS

syn keyword javaScriptGlobal		   self window instance

syn keyword javaScriptType		       JeefoObject

syn match   javaScriptGLOBALS	       "\<[A-Z_][A-Z_0-9]\+\>"

syn match   javaScriptDot	           +\.+
syn match   javaScriptComma	           +,+

syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD NOTE contained
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo   extend

syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	extend
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	extend

hi link javaScriptStringS        String
hi link javaScriptStringD        String

" ES6 template string
syn match  javascriptEndTemplateString  +`+
syn match  javaScriptTemplateDelim      "\${\|}" contained
syn region JavascriptTemplateVar        start=+${+ end=+}+  contains=javaScriptTemplateDelim keepend

hi javaScriptTemplateDelim ctermfg=40 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi JavascriptTemplateVar   ctermfg=4  ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi link javaScriptTemplateString String

syn region javaScriptTemplateString   start=+`+  skip=+\\\\\|\\`+ end=+`+  contains=JavascriptTemplateVar,javaScriptLineComment  keepend

call css_color#init('hex', 'hex', 'JavaScriptStringS,JavaScriptStringD,JavaScriptComment')

" Custom string embeded language syntax
unlet b:current_syntax
syn include @JavascriptHTML syntax/html.vim
syn region JavascriptEmbededHTML  start="TRIM_LINES_HTML`" end="`" contains=@JavascriptHTML  containedin=javaScriptTemplateString  keepend

unlet b:current_syntax
syn include @JavascriptSQL syntax/sql.vim
syn region JavascriptEmbededSQL  start="--\s\+SQL"  end="--\s\+SQL"  contains=@JavascriptSQL,JavascriptTemplateVar  containedin=javaScriptTemplateString  keepend

unlet b:current_syntax
syn include @JavascriptCSS syntax/css.vim
syn region JavascriptEmbededCSS  start="/\*\s*CSS\s*\*/"  end="/\*\s*CSS\s*\*/"  contains=@JavascriptCSS,JavascriptTemplateVar  containedin=javaScriptTemplateString  keepend

unlet b:current_syntax
syn include @JavascriptJT syntax/jt.vim
syn region JavascriptEmbededJT  start="{\s*JT\s*}"  end=+{\s*JT\s*}+ keepend contains=@JavascriptJT,JavascriptTemplateVar  containedin=javaScriptTemplateString
syn region JavascriptEmbededJT  start="JT_PRE`"  end="`" keepend contains=@JavascriptJT,JavascriptTemplateVar  containedin=javaScriptTemplateString


