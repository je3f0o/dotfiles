
" Required Vundle setup
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" airline
Plugin 'bling/vim-airline'
" ultisnips
Plugin 'SirVer/ultisnips'
" tabular
Plugin 'godlygeek/tabular'
" vim-repeat
Plugin 'tpope/vim-repeat'
" Surround
Plugin 'tpope/vim-surround'
" Solarized
Plugin 'altercation/vim-colors-solarized'

call vundle#end() " required
"filetype plugin indent on

