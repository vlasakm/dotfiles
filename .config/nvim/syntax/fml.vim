" Vim syntax file
" Language: FML 
" Maintainer: Konrad Siek
" Latest Revision: 8 February 2020

" Install in: ~/.vim/syntax/
" Load with: set syntax=fml

if exists("b:current_syntax")
  finish
endif

syn keyword fmlKeywords array 
syn keyword fmlKeywords begin end 
syn keyword fmlKeywords if then else
syn keyword fmlKeywords while do
syn keyword fmlKeywords object extends 
syn keyword fmlKeywords function 
syn keyword fmlKeywords let
syn keyword fmlKeywords this

syn keyword fmlBoolean true false

syn match fmlOperator "+"
syn match fmlOperator "-"
syn match fmlOperator "/"
syn match fmlOperator "%"
syn match fmlOperator "*"
syn match fmlOperator "=="
syn match fmlOperator "!="
syn match fmlOperator "\["
syn match fmlOperator "\]"
syn match fmlOperator "->"
syn match fmlOperator "<-"
syn match fmlOperator "="
syn keyword fmlOperator get set print

syn match fmlLineComment "//.*$"
syn region fmlBlockComment start="/\*" end="\*/"

syn match fmlNumber "[1-9][0-9]*"
syn match fmlNumber "-[1-9][0-9]*"

syn match fmlWiggle contained "\~"
syn match fmlEscape contained "\\n" 
syn match fmlEscape contained "\\t"
syn match fmlEscape contained "\\r"
syn region fmlString   start=+"+  skip=+\\"+  end=+"+ contains=fmlWiggle,fmlEscape 

syn match fmlIdentifier "[_A-Za-z][_A-Za-z0-9]*"

let b:current_syntax = "fml"

hi def link fmlIdentifier       Identifier
hi def link fmlKeywords         Statement 
hi def link fmlFunctions        Function
hi def link fmlLineComment      Comment
hi def link fmlBlockComment     Comment
hi def link fmlBoolean          Boolean
hi def link fmlWiggle           SpecialChar
hi def link fmlEscape           SpecialChar
hi def link fmlString           String
hi def link fmlNumber           Number
hi def link fmlOperator         Operator
