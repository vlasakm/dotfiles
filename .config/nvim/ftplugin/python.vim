autocmd BufWritePre <buffer> call Black()

function! Black()
	let pos = getcurpos()
	undojoin
	%!black - 2>/dev/null
	call setpos('.', pos)
endfunction
