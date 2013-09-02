setlocal ts=8
setlocal sw=8
setlocal noexpandtab

setlocal cindent
setlocal textwidth=80	" auto insert newline

" highlight >80
hi OverLength ctermbg=DarkGreen ctermfg=White guifg=White guibg=DarkGreen
match OverLength /\%>80v.\+/
