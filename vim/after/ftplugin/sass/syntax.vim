

syn region   sassComment	   start="\z(\s\+\|^\)\/\/.*$" end="^\%(\z1\s\|\s*$\)\@!" keepend

setfiletype sass
