
" Emmet - Enable in different mode
let g:user_emmet_mode="a"    "enable all function in all mode.

" Emmet - Enable just for html/css files
let g:user_emmet_install_global = 0

if ! exists('cliclick')
	EmmetInstall
endif

