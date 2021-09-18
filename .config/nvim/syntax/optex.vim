runtime! syntax/plaintex.vim

syn match   plaintexControlSequence         display contains=@NoSpell
      \ '\\[_.a-zA-Z@]\+'
