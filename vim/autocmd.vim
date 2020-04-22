
" I'm using Bash syntax highlight not Posix
let b:is_bash=1

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
endif
