function! Formatonsave()
	let l:lines="all"
	pyf /usr/share/clang/clang-format.py
endfunction

autocmd BufWrite <buffer> call Formatonsave()
