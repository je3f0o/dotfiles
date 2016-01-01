
if ! exists("*UnderlineHeading")
	function UnderlineHeading(level)
		if a:level == 1
			normal! yypVr=
		elseif a:level == 2
			normal! yypVr-
		else
			normal! I### 
		endif

		call repeat#set("\<Plug>UnderlineHeadingH" . a:level)
	endfunction
endif

for level in range(1, 3)
	execute 'nnoremap <Plug>UnderlineHeadingH' . level . ' :<C-U>call UnderlineHeading('.level.')<CR>'
	execute 'nmap <leader>h' . level . ' <Plug>UnderlineHeadingH' . level
endfor

nnoremap <leader>sop :source %<CR>
