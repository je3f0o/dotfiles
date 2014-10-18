
" Unmap the arrow keys
no <left> <Nop>
no <right> <Nop>
no <down> <Nop>
no <up> <Nop>
"ino <down> <Nop>
"ino <up> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" Exit insert or visual mode
imap jj <C-c>
vmap ii <C-c>

" Save file
nmap <C-s> :update<CR>
imap <C-s> <C-c>:update<CR>a
vmap <C-s> <C-c>:update<CR>gv

" Toggle NERDTree
nmap <F5> :NERDTreeToggle<CR>
imap <F5> <C-c>:NERDTreeToggle<CR>
vmap <F5> <C-c>:NERDTreeToggle<CR>

" add comment
nmap <C-_> ^i// <C-c>

" ------------------ NORMAL MODE ------------------
" I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Toggle list! command
nmap <leader>l :set list!<CR>

" Move window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Swap characters
nmap <C-u> xhhpl

" Indent and outdent
"nmap <C-]> <<
"nmap <C-]> >>

" Insert new line before or after
nmap gO O<ESC>j
nmap <S-CR> o<ESC>k " fucking not work :(

" Move line up or down
"no <down> ddp 
"no <up> ddkP 

" Remove quote
"nmap "" T"dht"lx

" Cut line
nmap <C-x> dd

" ------------------ INSERT MODE ------------------
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
" Indent and outdent
vmap <C-[> <gv
vmap <C-]> >gv

" ------------------------------------------------------------
" correction
iabbr ture true
iabbr flase false

