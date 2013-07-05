" ftplugin
filetype plugin indent on

" syntax highlighting
syntax enable

" Adds menu when you do :e/:vsp/need to look at local files
set wildmenu

" Line number
set number

" Search
set incsearch

" Color settings
set t_Co=256
set background=dark
colo robert
" let g:solarized_termcolors=256
" colorscheme solarized

" Window width
set textwidth=80

" tabbing settings
set cindent

" replaces error beep
set visualbell

" save cursor location
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal g'\"" | endif
endif

" highlight >80
hi OverLength ctermbg=59 ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

" Tagbar
nmap <F8> :TagbarToggle<CR>
