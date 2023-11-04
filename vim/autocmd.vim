" I'm using Bash syntax highlight not Posix
if !exists('*s:SetBashFlag')
  function s:SetBashFlag()
    let b:is_bash=1
    set filetype=sh
  endfunction
endif

if has("autocmd")
	" Enable filetype detection for after load startup
	filetype plugin on
	"filetype plugin indent on

	" Automatically apply any changes in vimrc
	"autocmd BufWritePost .vimrc tabe $MYVIMRC

  autocmd CompleteDone * pclose

	autocmd BufNewFile,BufRead * set noendofline
	autocmd BufNewFile,BufRead * set nofixendofline

	autocmd BufNewFile,BufRead *.md set filetype=markdown

  " Bindzone
  autocmd BufNewFile,BufRead */bind/zone.*	setf bindzone

  " Cache views
  function! s:MakeView()
    let l:filepath = expand('%:p')
    if filereadable(l:filepath) && stridx(l:filepath, '/tmp/') != 0
      mkview
    endif
  endfunction
  autocmd BufWinLeave ?* silent call s:MakeView()
	autocmd BufWinEnter ?* silent! loadview

  " Vim cursor
  autocmd InsertEnter * set cul
  autocmd InsertLeave * set nocul

  autocmd BufEnter,VimEnter *.sh call s:SetBashFlag()

  "autocmd VimLeavePre * bufdo diffoff
  autocmd QuitPre * windo diffoff

  " 1 is the blinky block cursor
  " 2 is the default (non-blinky) block cursor
  " 3 is blinky underscore
  " 4 fixed underscore
  " 5 pipe bar (blinking)
  " 6 fixed pipe bar
  let &t_SI = "\e[5 q" "
  let &t_EI = "\e[2 q"
  "let &t_SR = "\e[5 q"

  "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  "let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  "let &t_EI = "\<Esc>]50;CursorShape=0\x7"

endif