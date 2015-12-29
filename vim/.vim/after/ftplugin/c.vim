" Since the system level ftplugin/cpp.vim loads the system level
" ftplugin/c.vim... which also loads after/c.vim, we don't want 
" to run this stuff on a cpp file (or any other filetype for that matter)
if &ft != 'c'
	finish
endif

setlocal ts=8
setlocal sw=8
setlocal noexpandtab

setlocal cindent
setlocal textwidth=80	" auto insert newline
