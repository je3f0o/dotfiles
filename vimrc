" Of course
set nocompatible

" Append +=
" Ask variable's value -> set variable?

if exists('cliclick')
	source ~/.vim/robot_plugins.vim
elseif exists('weak_mode')
	source ~/.vim/modes/weak_mode.vim
elseif exists('book')
	source ~/.vim/modes/book.vim
elseif exists('facebook')
	source ~/.vim/modes/facebook.vim
else
	source ~/.vim/plugins.vim
endif

command! -nargs=+ Silent execute 'silent <args>' | redraw!

" Might be useful when u have some stupid highlight won't go away
" :call clearmatches()

let g:rust_recommended_style = 0
let g:python_recommended_style = 0
let g:pymode_lint_checkers = ['mccabe', 'pyflakes', 'pylint', 'pep8', 'pep257']
let g:pymode_lint_ignore = 'E111,W0311'
syntax on
syntax enable

" Modeline magic
set modeline
set modelines=1

" General settings
scriptencoding utf8
set encoding=utf8
set showmatch
set visualbell
set backspace=indent,eol,start
set mouse=a

" Automaticaly word wrap and insert new line
set textwidth=0
set nowrap

set number
set relativenumber
set cursorline
set cursorcolumn
"set colorcolumn=81

set hlsearch
set smartcase
set ignorecase
set incsearch

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path=*,**

" Display all matching files when we tab complete
set wildmenu

" Toggle paste
set pastetoggle=<F3>

" Syntastic
" let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Conque Terminal
" let g:ConqueTerm_CloseOnEnd = 1

" Some settings
"set list extends:>,precedes:<

" Invisible character symbol
set listchars=tab:▸\ ,eol:⏎
set showbreak="\u21aa "

" No new line end of file
set noendofline
set nofixendofline

" let configs
let mapleader = "\\"

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

" Syntastic
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"

" Load custom settings
source ~/.vim/variables.vim
source ~/.vim/functions.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/color.vim
source ~/.vim/autocmd.vim
source ~/.vim/syntax.vim

" Tab configs
set autoindent
set smarttab
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
" On pressing tab, insert spaces or tab (noexpandtab = tab, expandtab = spaces)
" after change the config use `:retab` to replace tabs
set expandtab

" Scroll offsest
set scrolloff=8

"set nofoldenable    " disable folding
set foldmethod=manual
"set foldmethod=marker
set foldlevel=3
set viewdir=~/.vimview

" Change buffer without saved
set hidden

" Vertical window split on right side
set splitright

set nobackup
" swapfile on
set swapfile

" correction
iabbr ture true
iabbr flase false
iabbr fasle false
iabbr recieve receive
iabbr cleant client

" Dictionary words
" set dictionary+=/usr/share/dict/words

" Cursor
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

if has("gui_running")
	source ~/.vim/gvimrc
endif

" You complete me
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_extra_conf_globlist = 0
let g:ycm_auto_hover = ''
let g:ycm_disable_signature_help = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1

" python...
"let g:ycm_confirm_extra_conf=0
"let g:ycm_python_binary_path='/usr/local/anaconda3/bin/python'
let g:ycm_python_binary_path='/usr/local/bin/python3.11'
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

"let g:clang_use_library = 1
"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"let g:clang_complete_auto = 1
"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'ultisnips'
"let g:clang_complete_macros = 1
"let g:clang_user_options = ' -DCLANG_COMPLETE_ONLY'

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"let g:SuperTabDefaultCompletionType = '<C-n>'

" ES lint
"let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" HTML Lint
let g:syntastic_html_checkers = []

" Flow
" let g:syntastic_javascript_checkers = ['eslint', 'flow']
" let g:syntastic_javascript_flow_exe = 'flow'

" Vim flow
let g:flow#enable = 0

" Test external command
let g:potion_command = "~/.vim/bundle/potion"

" init modes
source ~/.vim/modes/modes.vim