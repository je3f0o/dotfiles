
" Required Vundle setup
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" js highlight
" Plugin 'pangloss/vim-javascript'

" NERD_tree
Plugin 'scrooloose/nerdtree'
" Graphical undo tree
Plugin 'sjl/gundo.vim'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" Neo Complete
"Plugin 'Shougo/neocomplete.vim'
" clang_complete
"Plugin 'Rip-Rip/clang_complete'
" Tern JS autocompletor using YouCompleteMe
Plugin 'ternjs/tern_for_vim'
" airline
Plugin 'bling/vim-airline'
" ctrlp (fuzzy finder)
" Plugin 'kien/ctrlp.vim'
" easymotion
Plugin 'Lokaltog/vim-easymotion'
" emmet
Plugin 'mattn/emmet-vim'
" fugitive
Plugin 'tpope/vim-fugitive'
" jade
Plugin 'digitaltoad/vim-jade'
" seti
Plugin 'trusktr/seti.vim'
" simple-todo
Plugin 'vitalk/vim-simple-todo'
" supertab
Plugin 'ervandew/supertab'
" syntastic
Plugin 'scrooloose/syntastic'
" tabular
Plugin 'godlygeek/tabular'
" ultisnips
Plugin 'SirVer/ultisnips'
" unimpaired
Plugin 'tpope/vim-unimpaired'
" vim-glsl
Plugin 'tikhomirov/vim-glsl'
" vim-repeat
Plugin 'tpope/vim-repeat'
" Surround
Plugin 'tpope/vim-surround'
" All 256 xterm colors with their RGB equivalents, right in Vim!
Plugin 'guns/xterm-color-table.vim'
" Solarized
Plugin 'altercation/vim-colors-solarized'
" Conque Shell
"Plugin 'vim-scripts/Conque-Shell'
" Markdown syntax highlight
Plugin 'plasticboy/vim-markdown'

" Vim do
"Plugin 'joonty/vim-do'

" Pandoc
" Plugin 'vim-pandoc/vim-pandoc'
" Typescript
Plugin 'leafgarland/typescript-vim'
" TypeScript auto complate
Plugin 'Quramy/tsuquyomi'

"Plugin 'Shougo/vimproc.vim'

" Kontakt Scripting Processor
Plugin 'nojanath/vim-ksp'

" Exchange
Plugin 'tommcdo/vim-exchange'

" Flow type
"Plugin 'flowtype/vim-flow'

" Hex colors
Plugin 'je3f0o/vim-css-color'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

"Nginx"
"Plugin 'vim-scripts/nginx.vim'
Plugin 'chr4/nginx.vim'

"Plugin 'felixge/vim-nodejs-errorformat'

"Plugin 'isRuslan/vim-es6'

call vundle#end() " required
"filetype plugin indent on