
" I'm using Bash syntax highlight not Posix
function s:SetBashFlag()
    let b:is_bash=1
    set filetype=sh
endfunction

if has("autocmd")
	" Enable filetype detection for after load startup
	filetype plugin on
	"filetype plugin indent on

	" Automatically apply any changes in vimrc
	"autocmd BufWritePost .vimrc tabe $MYVIMRC

	autocmd BufNewFile,BufRead *.md set filetype=markdown

    " Javasciprt header
	autocmd BufNewFile *.js :call PreHeaderJavascript()

    " Forks
	autocmd BufWinLeave ?* mkview
	autocmd BufWinEnter ?* silent loadview

    " Vim cursor
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul

    autocmd BufEnter,VimEnter *.sh call s:SetBashFlag()

    "autocmd VimLeavePre * bufdo diffoff
    autocmd QuitPre * windo diffoff
endif
