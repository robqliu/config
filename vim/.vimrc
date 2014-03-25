" make it incompatible with vi. necessary for some vim settings. 
" supposed to go first in the .vimrc
set nocompatible

" remove all autocmds in this group (all autocmds in this vimrc 
" use the same group). allows sourcing this .vimrc multiple times without
" accidentally redefining autocmds (<- what's actually wrong with this? no
" idea))
augroup uservimrc
au!
" all autocmds defined below will be in uservimrc... we restore
" the previous augroup at the end

" ============================ OS specific  ============================ 
if has("win32") || has("win64")
	au BufWritePost .vimrc source $MYVIMRC
elseif has("unix")
	au BufWritePost .vimrc source %
endif

" ============================ General ============================ 
" turns on filetype detection, filetype plugins, and filetype indent files
filetype plugin indent on

syntax on		" syntax highlighting
set incsearch		" match while typing
set number		" show line numbers
set wildmenu		" adds menu when you do :e/:vsp/need to look at local 
			" files
set visualbell		" replaces error beep
set ruler		" display cursor position on statusline
set showcmd		" displays some status information for a command (e.g.
			" the number of lines when selecting multiple lines

" color settings
set t_Co=256
colo robert

" save cursor location when closing/opening file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" ctags
" Search for tags in current file's directory up to root
" Search for .git/tags in current file's directory up to root
set tags=./tags;/,./.git/tags;/

" restore the normal augroup
augroup end
