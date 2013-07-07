augroup usergvimrc
au!

if has("win32") || has("win64")
	set guifont=Consolas:h10
	au BufWritePost _gvimrc source $MYGVIMRC
elseif has("unix")
	au BufWritePost .gvimrc source %
endif

"guioptions
set guioptions-=T	" toolbar
set guioptions+=c	" use console dialogs instead of popups for "simple choices"

augroup end
