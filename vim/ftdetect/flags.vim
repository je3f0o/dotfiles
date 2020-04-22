
function SetBashFlag()
    let b:is_bash=1
    set filetype=sh
endfunction

autocmd BufRead,BufNewFile *.sh call SetBashFlag()
