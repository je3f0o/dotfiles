
if ! exists("*MyMarkDownFolds")
	function MyMarkDownFolds()
		let thisline = getline(v:lnum)
		if match(thisline, "^##") >= 0
			return ">2"
		elseif match(thisline, "^#") >= 0
			return ">1"
		else
			return "="
		endif
	endfunction
endif

if ! exists("*MyMarkDownFoldText")
	function MyMarkDownFoldText()
		let foldsize = (v:foldend-v:foldstart)
		return getline(v:foldstart) . " (" . foldsize . ") "
	endfunction
endif

setlocal foldcolumn=3
setlocal foldmethod=expr
setlocal foldexpr=MyMarkDownFolds()
setlocal foldtext=MyMarkDownFoldText()

