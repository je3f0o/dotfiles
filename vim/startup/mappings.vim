
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

" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
"nnoremap d "_d
"vnoremap d "_d
"nnoremap D "_D
"vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" Paste without yank
" Reference: https://stackoverflow.com/a/5093286/1352771
xnoremap <expr> p 'pgv"'.v:register.'y`>'

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
nnoremap <leader>h :nohlsearch<CR>
inoremap <leader>h <C-c>:nohlsearch<CR>a
vnoremap <leader>h <C-c>:nohlsearch<CR>gv

" Toggle directory mode
nnoremap <leader>rd <C-c>:Ex<CR>

" Visual select surrounded quotes without include leading whitespace
nnoremap va' v2i'
nnoremap va" v2i"
nnoremap va` v2i`

nnoremap ca' c2i'
nnoremap ca" c2i"
nnoremap ca` c2i`

" Bubble lines
"nnoremap <C-Up> [e
"nnoremap <C-Down> ]e
"nnoremap <C-k> :m-2<cr>
"nnoremap <C-j> :m+<cr>
"nnoremap <C-h> <<
"nnoremap <C-l> >>

" YCM keys
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>

" Window keys
nnoremap <leader>w <C-w>
inoremap <leader>w <C-w>
vnoremap <leader>w <C-w>

" Switch window
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Close current window
nnoremap <C-q> <C-w>c
inoremap <C-q> <C-c><C-q>
vnoremap <C-q> <C-c><C-q>

" Kill current buffer
nnoremap <C-w> :bd<CR>
inoremap <C-w> <C-c><C-w>
vnoremap <C-w> <C-c><C-w>

" Toggle folds
nnoremap <Space> za

" Always use exact location and easier to press
"nnoremap ' `
" Mark cursor location and center screen
nnoremap <leader>ga 'azz

" Fold marker
inoremap <leader>[ <ESC>:call MakeFoldMarker()<CR>a
inoremap <leader>] }}}

" Copy to clipboard
let s:uname = substitute(system('uname'), '\n', '', '')
if s:uname == 'Linux'
    " Ubuntu 18 - vim 8 has problem with clipboard

    if !exists('*CopyUnderCursor')
        function CopyUnderCursor()
            let l:char = matchstr(getline('.'), '\%' . col('.') . 'c.')
            call system('xsel -i -b', l:char)
        endfunction

        nnoremap <silent> <C-y> :call CopyUnderCursor()<CR>
    endif

    if !exists('*CopyVisualSelection')
        function CopyVisualSelection() range
            let n = @n
            silent! normal gv"ny
            call system('xsel -i -b', @n)
            let @n = n
        endfunction

        vnoremap <silent> <C-y> :call CopyVisualSelection()<CR>
    endif
else
    nnoremap <C-y> "+y
    vnoremap <C-y> "+y
endif
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

" Swap characters
nnoremap <C-u> xhPl

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
vnoremap ; :
vnoremap : ;

" Copy line to
nnoremap <C-t> :t.<left><left>

" Toggle number
nnoremap <leader>n :call CycleLineNumbers()<CR>

" nnoremap <C-a> ggVG


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

nnoremap <leader>t= :Tabularize /^[^=]*\zs=\s*/l1r0<CR>
vnoremap <leader>t= :Tabularize /^[^=]*\zs=\s*/l1r0<CR>
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
vnoremap <leader>t\ :Tabularize /\\<CR>

" Soft wrap prefix

" Conque Term
" nnoremap <C-m> :ConqueTerm bash --login<CR>

" YouCompleteMe
nnoremap <C-g> :YcmCompleter GoToDefinition<CR>
"nnoremap <C-g> :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>d :YcmCompleter GoToDefinition<CR>

" ToggleComment
" actual map is: <C+/> special map key whatever...
nnoremap <C-_> :ToggleComment<CR>
vnoremap <C-_> :ToggleComment<CR> gv

" Move selected text
"vnoremap J :move '>+1<CR>gv=gv
"vnoremap K :move '<-2<CR>gv=gv
vnoremap J :move '>+1<CR>gv
vnoremap K :move '<-2<CR>gv
"vnoremap <C-k> [egv
"vnoremap <C-j> ]egv
" left
vnoremap <S-h> <gv
" righ
vnoremap <S-l> >gv

" Preserves cursor position
"nnoremap J mzJ:execute "normal! " . (getline('.')[col('.')-1] == ' ' ? 'x' : '') . '`z'<CR>

function! SmartJoin()
  " Mark the current position
  normal! mz
  " Join the current line with the line below
  normal! J
  " Check if the character under the cursor is a space
  if getline('.')[col('.') - 1] == ' '
    " Delete the space character
    normal! x
  endif
  " Return to the marked position
  normal! `z
endfunction

nnoremap J :call SmartJoin()<CR>
nnoremap G :G<CR>