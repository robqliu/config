setlocal ts=8
setlocal sw=8
setlocal noexpandtab

setlocal cindent
setlocal textwidth=100

set colorcolumn=100

" highlight >100
hi OverLength ctermbg=DarkGreen ctermfg=White guifg=White guibg=DarkGreen
match OverLength /\%>100v.\+/
