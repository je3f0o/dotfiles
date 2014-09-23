" Unmap the arrow keys

" Normal mode
no <down> <Nop> 
no <up> <Nop> 
no <left> <Nop>
no <right> <Nop>

" Insert mode
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

" Visual mode
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>


nmap gO O<ESC>j
nmap g<C-O> o<ESC>k

" I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" correction
iabbr ture true
iabbr flase false


" correction
iabbr ture true
iabbr flase false


" correction
iabbr ture true
iabbr flase false

