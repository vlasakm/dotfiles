au BufNewFile,BufRead *aerc*.eml setf mail
au BufNewFile,BufRead /tmp/*     setf temporary
au BufNewFile,BufRead *.opm      setf tex

" override filetype.vim
au BufNewFile,BufRead *.am       set ft=automake
