" Vim color file
" Original Maintainer: Robert Liu
"
" Modified version of wombat256mod by
" 	Lars H. Nielsen (dengmao@gmail.com)
" Modified version of wombat for 256-color terminals by
"   David Liang (bmdavll@gmail.com)
" based on version by
"   Danila Bespalov (danila.bespalov@gmail.com)

set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "robert"

" General colors
hi Normal		ctermfg=254		ctermbg=234		cterm=none		guifg=#e4e4e4	guibg=#1c1c1c	gui=none
hi Cursor		ctermfg=234		ctermbg=228		cterm=none		guifg=#1c1c1c	guibg=#ffff87	gui=none
hi Visual		ctermfg=251		ctermbg=239		cterm=none		guifg=#c6c6c6	guibg=#4e4e4e	gui=none
hi VisualNOS	ctermfg=251		ctermbg=236		cterm=none		guifg=#c3c6ca	guibg=#303030	gui=none
hi Search		ctermfg=177		ctermbg=241		cterm=none		guifg=#d787ff	guibg=#626262	gui=none
hi Folded		ctermfg=103		ctermbg=237		cterm=none		guifg=#a0a8b0	guibg=#3a4046	gui=none
hi Title		ctermfg=230						cterm=bold		guifg=#ffffd7					gui=bold
hi StatusLine	ctermfg=230		ctermbg=238		cterm=none		guifg=#ffffd7	guibg=#444444	gui=italic
hi VertSplit	ctermfg=238		ctermbg=238		cterm=none		guifg=#444444	guibg=#444444	gui=none
hi StatusLineNC	ctermfg=241		ctermbg=238		cterm=none		guifg=#857b6f	guibg=#444444	gui=none
hi LineNr		ctermfg=241		ctermbg=232		cterm=none		guifg=#857b6f	guibg=#080808	gui=none
hi SpecialKey	ctermfg=241		ctermbg=235		cterm=none		guifg=#626262	guibg=#2b2b2b	gui=none
hi WarningMsg	ctermfg=203										guifg=#ff5f55
hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold		guifg=#ff2026	guibg=#3a3a3a	gui=bold

" Vim >= 7.0 specific colors
if version >= 700
	hi CursorLine				ctermbg=236	cterm=NONE					guibg=#32322f
	hi MatchParen	ctermfg=228	ctermbg=101	cterm=bold	guifg=#eae788	guibg=#857b6f	gui=bold
	hi Pmenu		ctermfg=230	ctermbg=238				guifg=#ffffd7	guibg=#444444
	hi PmenuSel		ctermfg=232	ctermbg=192				guifg=#080808	guibg=#ac7fda
endif

" Diff highlighting
hi DiffAdd					ctermbg=17								guibg=#2a0d6a
hi DiffDelete	ctermfg=234	ctermbg=60	cterm=NONE	guifg=#242424	guibg=#3e3969	gui=NONE
hi DiffText					ctermbg=53	cterm=NONE					guibg=#73186e	gui=NONE
hi DiffChange				ctermbg=237								guibg=#382a37

"hi CursorIM
"hi Directory
"hi IncSearch
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar
"hi SignColumn
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu


" Syntax highlighting
hi Keyword		ctermfg=111	cterm=NONE	guifg=#87afff	gui=NONE
hi Statement	ctermfg=68	cterm=NONE	guifg=#5f87d7	gui=NONE
hi Constant		ctermfg=173	cterm=NONE	guifg=#d7875f	gui=NONE
hi Number		ctermfg=173	cterm=NONE	guifg=#d7875f	gui=NONE
hi PreProc		ctermfg=173 cterm=NONE	guifg=#d7875f	gui=NONE
hi Function		ctermfg=192	cterm=NONE	guifg=#d7ff87	gui=NONE
hi Identifier	ctermfg=192	cterm=NONE	guifg=#d7ff87	gui=NONE
hi Type			ctermfg=210	cterm=NONE	guifg=#ff8787	gui=NONE
hi Special		ctermfg=48	cterm=NONE	guifg=#eadead	gui=NONE
hi String		ctermfg=113 cterm=NONE	guifg=#87d75f	gui=italic
hi Comment		ctermfg=246	cterm=NONE	guifg=#949494	gui=italic
hi Todo			ctermfg=101	cterm=NONE	guifg=#87875f	gui=italic


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine
hi! link NonText		LineNr

" vim:set ts=4 sw=4 noet:
