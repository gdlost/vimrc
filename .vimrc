source $VIMRUNTIME/defaults.vim

if has('gui')
	if has('win32')
		set guifont=Courier_New:h11:cANSI:qDRAFT
	endif
endif

" Statusline config
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

function! Start()
	if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        	return
    	endif
	" Crear un buffer nuevo
	enew

	" Opciones para el buffer
	setlocal
		\ bufhidden=wipe
		\ buftype=nofile
		\ nobuflisted
		\ nocursorcolumn
		\ nocursorline
		\ nolist
		\ nonumber
		\ noswapfile
		\ norelativenumber

	" Escribir un texto en el buffer
	" https://vi.stackexchange.com/questions/627/how-can-i-change-vims-start-or-intro-screen/715#715
	call append('$', ' ')

	setlocal nomodifiable nomodified

	nnoremap <buffer><silent> e :enew<CR>
	nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
	nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

autocmd VimEnter * call Start()
