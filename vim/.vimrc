" make it incompatible with vi. necessary for some vim settings. 
" supposed to go first in the .vimrc
set nocompatible

" remove all autocmds in this group (all autocmds in this vimrc 
" use the same group). allows sourcing this .vimrc multiple times without
" accidentally redefining autocmds (TODO: what's actually wrong with this?)
augroup uservimrc
au!

" ============================ OS specific  ============================
" auto source .vimrc when .vimrc is written to
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
set backspace=indent,eol,start " backspace over more things
set colorcolumn=+1	" puts a column marker 1 character to the right of textwidth
set laststatus=2	" keep the status line

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j
endif

" ============================ Aliases ============================
" Taken from http://stackoverflow.com/a/16625961
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

" ============================ Color ============================
" color settings
set t_Co=256
colo robert

" ============================ Plugins ============================
execute pathogen#infect()
set rtp+=/usr/local/opt/fzf

" ============================ Misc ============================
" save cursor location when closing/opening file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

augroup end
