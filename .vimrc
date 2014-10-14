call pathogen#infect()
call pathogen#helptags()

syntax on
syntax enable

" General settings
set nocompatible
scriptencoding utf8
set encoding=utf8
set number
set showbreak=+++
set textwidth=100
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set noexpandtab
set smarttab
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Some settings
"set list extends:>,precedes:<

" Invisible character symbol
set listchars=tab:▸\ ,eol:¬

" Load custom settings
source ~/.vim/startup/color.vim
source ~/.vim/startup/mappings.vim

" Airline
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#enabled=1
"let g:airline#extensions#hunks#enabled=0

"let g:airline_theme="badwolf"
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'
