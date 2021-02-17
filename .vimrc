" Set Courier New as font in gvim (windows)
if has('gui')
	if has('win32')
		set guifont=Courier_New:h11:cANSI:qDRAFT
	endif
endif

" Plugins {{{1
" I use Plug for Plugin Management, so, I will check if installed
" TODO: Detection of Plug
"if exists('plug#begin')
        call plug#begin()

        if executable('node')
                Plug 'neoclide/coc.nvim', {'branch': 'release'}
        endif

        Plug 'preservim/nerdtree'
        Plug 'kaicataldo/material.vim', {'branch': 'main'}
        call plug#end()
        
        " Plugin Manager Related stuff
        if (has('termguicolors'))
                set termguicolors
        endif

        let g:material_terminal_italics = 1
        let g:material_theme_style = 'darker'
        colorscheme material

"endif
" }}}

" General config {{{1
syntax on
set autoindent 
set expandtab 
set tabstop=8
set number
set relativenumber
set noerrorbells
set foldmethod=marker
" End General config
" }}}

" Key mappings {{{1
if exists(":NERDTreeToggle")
        nnoremap <C-n> :NERDTreeToggle<CR>
endif

imap <c-d> <esc>ddi
imap <c-z> <esc>ui

nnoremap <space> <nop>
let mapleader="\<Space>"

" Next Tab
nnoremap <leader>n gt
" Prev Tab
nnoremap <leader>b gT
" Uppercase WORD
nnoremap <leader>u gUiw
" Lowercase word
nnoremap <leader>l guiw

" }}}

" Autocommands {{{1

autocmd FileType make set noexpandtab shiftwidth=9 softtabstop=8

" }}}

" Statusline {{{1
let g:currentMode = { 
	\ 'n': 'NORMAL', 
	\ 'v': 'VISUAL', 
	\ 'i': 'INSERT'  
	\}

set laststatus=2
set statusline=\ %F\ %y\ 

"Linea/Total (Columna)
set statusline+=%l\/%L\ (%v)
set statusline+=%=
set statusline+=%{g:currentMode[mode()]}
set statusline+=\ 
set statusline+=\|
set statusline+=\ 
set statusline+=%{strftime('%H:%M')}\ 
" }}}
