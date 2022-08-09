" make it incompatible with vi. necessary for some vim settings. 
" supposed to go first in the .vimrc
set nocompatible

set rtp+=~/vimfiles,/usr/local/opt/fzf

" remove all autocmds in this group (all autocmds in this vimrc 
" use the same group). allows sourcing this .vimrc multiple times without
" accidentally redefining autocmds (TODO: what's actually wrong with this?)
augroup uservimrc
au!

" source vimrc when saving files
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" ============================ Plugins ============================
" Pathogen
" execute pathogen#infect()

" vim-plug
call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'lervag/vimtex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_compiler_latexmk = {
       \ 'options' : [
       \   '-verbose',
       \ ],
       \}

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" ============================ General ============================
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

" When formatting lists, vertically aligns after the list marker
set formatoptions+=n

" Yank to windows clipboard (WSL support)
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" ============================ Aliases ============================
" Taken from http://stackoverflow.com/a/16625961
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

" ============================ Visual ============================
colo robert
if &term =~ '^xterm'
	let &t_SI .= "\<Esc>[3 q"
	let &t_EI .= "\<Esc>[2 q"
	" 1 or 0 -> blinking block
	" 2 -> solid block
	" 3 -> blinking underscore
	" 4 -> solid underscore
	" Recent versions of xterm (282 or above) also support
	" 5 -> blinking vertical bar
	" 6 -> solid vertical bar
endif
set guifont=Consolas:h10:b:cANSI

" ============================ Misc ============================
" save cursor location when closing/opening file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
