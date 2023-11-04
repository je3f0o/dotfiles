
"if !exists("s:is_loaded") && has("autocmd")
"  " Automatically removing all trailing whitespace
"  autocmd BufWritePre * %s/\s\+$//e
"
"  " Update header
"	autocmd BufNewFile *.js               call PreHeaderJavascript()
"	autocmd BufWritePre,FileWritePre *.js call UpdateHeaderJavascript()
"
"  let s:is_loaded = 1
"endif