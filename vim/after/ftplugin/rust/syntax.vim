unlet b:current_syntax
syn include @RustSQL syntax/sql.vim

syn region RustEmbededSQL  matchgroup=rustStringDelimiter  start="--\s\+SQL"  end="--\s\+SQL"  contains=@RustSQL  containedin=rustString  keepend