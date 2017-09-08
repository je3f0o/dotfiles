
function make_pdf {
	pandoc --latex-engine=xelatex -V 'mainfont:Arial' -V 'geometry:margin=1in' --toc "$1" -o "$2.pdf"
}
