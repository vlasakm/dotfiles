" disable V language, *.v is verilog
let g:polyglot_disabled = ['v']

au BufNewFile,BufRead *aerc*.eml setf mail
au BufNewFile,BufRead /tmp/* setf temporary

au BufNewFile,BufRead *.opm setf tex
au BufNewFile,BufRead etex.src setf tex
au BufNewFile,BufRead *.mkxl setf tex
au BufNewFile,BufRead *.ins setf tex
au BufNewFile,BufRead *.lfg setf lua
au BufNewFile,BufRead *.lmt setf lua


" override filetype.vim
au BufNewFile,BufRead *.am set ft=automake
au BufNewFile,BufRead etexdefs.lib set ft=tex
