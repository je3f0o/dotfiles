
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

no Q <Nop>
vno Q <Nop>

" Exit insert or visual mode
inoremap jj <C-c>
vnoremap ii <C-c>

" Save file
nnoremap <C-s> :update<CR>:echo "Saved"<CR>
inoremap <C-s> <ESC>:update<CR>:echo "Saved"<CR>a
vnoremap <C-s> <C-c>:update<CR>:echo "Saved"<CR>gv

" Toggle NERDTree
nnoremap <F5> :NERDTreeToggle<CR>
inoremap <F5> <C-c>:NERDTreeToggle<CR>
vnoremap <F5> <C-c>:NERDTreeToggle<CR>

" Toggle Gundo
nnoremap <F6> :GundoToggle<CR>

" Toggle search highlight
nnoremap <leader>h :set hlsearch!<CR>
inoremap <leader>h <C-c>:set hlsearch!<CR>a
vnoremap <leader>h <C-c>:set hlsearch!<CR>gv

" Bubble lines
nnoremap <C-Up> [e
nnoremap <C-Down> ]e
nnoremap <C-Left> <<
nnoremap <C-Right> >>

vnoremap <C-K> [egv " up
vnoremap <C-J> ]egv " down
vnoremap <C-H> <gv  " left
vnoremap <C-L> >gv  " righ

" Window keys
nnoremap <leader>w <C-w>
inoremap <leader>w <C-w>
vnoremap <leader>w <C-w>

" Kill current buffer
nnoremap <silent> <C-w> :bd<CR>
inoremap <C-w> <C-c><C-w>
vnoremap <C-w> <C-c><C-w>

" Toggle folds
nnoremap <Space> za
" Fold marker
inoremap <leader>[ <ESC>:call MakeFoldMarker()<CR>a
inoremap <leader>] }}}

" Copy to clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
" Paste from clipboard
nnoremap <F2> "+gp
inoremap <F2> <C-c>"+gpi
vnoremap <F2> "+gp


" ------------------ NORMAL MODE ------------------
" I really hate that things don't auto-center
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
nnoremap [c [czz
nnoremap ]c ]czz

nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

nmap <leader>- ;syn sync fromstart<CR>

" Toggle list! command
nnoremap <leader>l :set list!<CR>

" Move window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Swap characters
nnoremap <C-u> xhhpl

" Insert new line before or after
nnoremap gO O<ESC>j
nnoremap <S-CR> o<ESC>k " fucking not work :(

" Remove quote
"nmap "" T"dht"lx

" Cut line
nnoremap <C-x> dd

" Quick edit
" vimrc
nnoremap <silent> <leader>evr :e $MYVIMRC<CR>
" vim mappings
nnoremap <silent> <leader>evm :exec ":e " . MYVIMMAP<CR>
" vim plugins
nnoremap <silent> <leader>evp :exec ":e " . MY_VIM_PLUGINS<CR>

" reload vimrc
nnoremap <silent> <leader>vr :source $MYVIMRC<CR>:echo "vimrc reloaded."<CR>

" I don't want to SHIFT + semicolon anymore
nnoremap ; :
nnoremap : ;

" Copy line to
nnoremap <C-t> :t.<left><left>

" Toggle number
nnoremap <leader>n :call CycleLineNumbers()<CR>

nnoremap <C-a> ggVG


" ------------------ INSERT MODE ------------------
" Move cursor 
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

" Insert new line
"inoremap <C-CR> 

" ------------------ VISUAL MODE ------------------

vnoremap <leader>" c""<C-c>P
vnoremap <leader>' c''<C-c>P

" -------------------------------------------------

nnoremap <leader>t= :Tabularize /=<CR>
vnoremap <leader>t= :Tabularize /=<CR>
nnoremap <leader>t; :Tabularize /:<CR>
vnoremap <leader>t; :Tabularize /:<CR>
nnoremap <leader>t{ :Tabularize /{<CR>
vnoremap <leader>t{ :Tabularize /{<CR>
nnoremap <leader>t} :Tabularize /}<CR>
vnoremap <leader>t} :Tabularize /}<CR>
nnoremap <leader>t, :Tabularize /,<CR>
vnoremap <leader>t, :Tabularize /,<CR>
nnoremap <leader>t[ :Tabularize /[<CR>
vnoremap <leader>t[ :Tabularize /[<CR>
nnoremap <leader>t] :Tabularize /\]<CR>
vnoremap <leader>t] :Tabularize /\]<CR>

" Conque Term
" nnoremap <C-m> :ConqueTerm bash --login<CR>

" YouCompleteMe
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>f :YcmCompleter GoToDefinition<CR>

if !exists("*HTMLEmmetMapping")
	function HTMLEmmetMapping()
		nmap <buffer> <Tab> <C-y>,
		imap <buffer> <Tab> <C-c><C-y>,i
	endfunction
endif

if has("autocmd")
	" Emmet - remap
	autocmd BufNewFile,BufRead *.html :call HTMLEmmetMapping()
	autocmd BufNewFile,BufRead *.md set filetype=markdown
endif
