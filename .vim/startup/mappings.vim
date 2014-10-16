
" ------------------ NORMAL MODE ------------------
" Unmap the arrow keys
no <left> <Nop>
no <right> <Nop>

" Move line up or down
no <down> ddp 
no <up> ddkP 

" Do not understand right now, fuck I really need to write comments
nmap gO O<ESC>j
nmap g<C-O> o<ESC>k

" I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Toggle list! command
nmap <leader>l :set list!<CR>

" GUI MODE move window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Swap characters
nmap <C-u> xhhpl

" Indent and outdent
"nmap <C-]> <<
"nmap <C-]> >>

" ------------------ INSERT MODE ------------------
" Unmap the arrow keys
"ino <down> <Nop>
"ino <up> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>

" Exit insert mode
imap jj <ESC>

" Move cursor 
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

" Quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" ------------------ VISUAL MODE ------------------
" Unmap the arrow keys
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" Indent and outdent
vmap <C-[> <gv
vmap <C-]> >gv

" ------------------------------------------------------------
" correction
iabbr ture true
iabbr flase false

