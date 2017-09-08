
" silent setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

nmap <leader>f ggVG !xmllint --format -<CR>
