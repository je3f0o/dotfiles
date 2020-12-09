
syn clear   javaScriptGlobal
syn clear   javaScriptGLOBALS
syn clear   javaScriptComment
syn clear   javaScriptCommentTodo
syn clear   javaScriptStringD
syn clear   javaScriptStringS

syn keyword javaScriptGlobal		   self window instance

syn keyword javaScriptType		       JeefoObject

syn match   javaScriptGLOBALS	       "\<[A-Z_][A-Z_0-9]*\>"

syn match   javaScriptDot	           +\.+
syn match   javaScriptComma	           +,+

syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD NOTE contained
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo   extend

syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	extend
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	extend

" ES8 keywords
syntax keyword jsAsyncKeyword async await yield
hi link jsAsyncKeyword Keyword

hi link javaScriptStringS        String
hi link javaScriptStringD        String

" ES6 template string
syn match  javascriptEndTemplateString  +`+
syn match  javaScriptTemplateDelim      "\${\|}" contained
syn region jsTemplateExpression matchgroup=jsTemplateExpressionBraces  start=+${+ end=+}+  contains=@js  keepend
syn region javaScriptTemplateString   start=+`+  skip=+\\\\\|\\`+ end=+`+ contains=jsTemplateExpression   keepend


call css_color#init('hex', 'hex', 'JavaScriptStringS,JavaScriptStringD,JavaScriptComment')

" Custom string embeded language syntax
unlet b:current_syntax
syn include @js syntax/javascript.vim
unlet b:current_syntax
syn include @JavascriptJT syntax/jt.vim
unlet b:current_syntax
syn include @JavascriptHTML syntax/html.vim
unlet b:current_syntax
syn include @JavascriptSQL syntax/sql.vim
unlet b:current_syntax
syn include @JavascriptCSS syntax/css.vim
unlet b:current_syntax
syn include @JavascriptSASS syntax/sass.vim

syn region JavascriptEmbededHTML  start="<!--\s*HTML\s*-->" end=+<!--\s*HTML\s*-->+ contains=@JavascriptHTML  containedin=javaScriptTemplateString keepend
syn region JavascriptEmbededSQL   start="--\s\+SQL"         end="--\s\+SQL"  contains=@JavascriptSQL,jsTemplateExpression  containedin=javaScriptTemplateString  keepend
syn region JavascriptEmbededCSS   start="/\*\s*css\s*\*/"   end="/\*\s*css\s*\*/"  contains=@JavascriptCSS  containedin=javaScriptTemplateString  keepend
syn region JavascriptEmbededSASS  start="/\*\s*sass\s*\*/"  end="/\*\s*sass\s*\*/"  contains=@JavascriptSASS  containedin=javaScriptTemplateString keepend
syn region JavascriptEmbededJT    start=+{\s*JT\s*}+        end=+{\s*JT\s*}+ contains=@JavascriptJT  containedin=javaScriptTemplateString keepend

let b:current_syntax = 'javascript'

hi jsTemplateExpressionBraces ctermfg=4 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi link javaScriptTemplateString String

if $TERM == "xterm-256color-italic"
    hi Comment cterm=italic ctermfg=9
endif

