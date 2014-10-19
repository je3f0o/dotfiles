
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
nmap <C-s> :update<CR>:echo "Saved"<CR>
imap <C-s> <C-c>:update<CR>:echo "Saved"<CR>a
vmap <C-s> <C-c>:update<CR>:echo "Saved"<CR>gv

" Toggle NERDTree
nmap <F5> :NERDTreeToggle<CR>
imap <F5> <C-c>:NERDTreeToggle<CR>
vmap <F5> <C-c>:NERDTreeToggle<CR>

" add comment
nmap <C-_> ^i// <C-c>

" Bubble lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-Left> <<
nmap <C-Right> >>

vmap <C-K> [egv " up
vmap <C-J> ]egv " down
vmap <C-H> <gv  " left
vmap <C-L> >gv  " righ

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

" Insert new line before or after
nmap gO O<ESC>j
nmap <S-CR> o<ESC>k " fucking not work :(

" Remove quote
nmap "" T"dht"lx

" Cut line
nmap <C-x> dd

" Quickly edit/reload the vimrc file
nmap <silent> <leader>evr :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" Quickly edit vim mappings file
nmap <silent> <leader>evm :exec ":e " . MYVIMMAP<CR>

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




if exists(":Tabularize")
	nmap <leader>t= :Tabularize /=<CR>
	vmap <leader>t= :Tabularize /=<CR>
	nmap <leader>t: :Tabularize /:<CR>
	vmap <leader>t: :Tabularize /:<CR>
endif

if has("autocmd")
	autocmd FileType html exec ":source " . expand("<sfile>:p:h") . "/html.vim"
endif


