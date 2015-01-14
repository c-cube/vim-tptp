" Vim syntax file
" Language:		TPTP
" Filename extensions:	*.p (collides with Pascal/Progress),
" Maintainer:		Simon Cruanes (heavily inspired from progress.vim file)
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
"elseif exists("b:current_syntax")
"	finish
endif

if version >= 600
  setlocal iskeyword=@,48-57,_,-,!,#,$,%
else
  set iskeyword=@,48-57,_,-,!,#,$,%
endif

" tabs = evil
set expandtab

syn case match

syn keyword     tptpRole        axiom conjecture negated_conjecture hypothesis type
syn keyword     tptpLogic       fof tff thf cnf include

syn match       tptpDollar      "\<\$\w+\>"
syn match       tptpDollarDollar "\<\$\$\w+\>"

syn match       tptpQuote       "'[^"]*'"
syn match       tptpDoubleQuote "\"[^"]*\""

syn match       tptpConnective  ":"
syn match       tptpConnective  "|"
syn match       tptpConnective  "&"
syn match       tptpConnective  "="
syn match       tptpConnective  "=>"
syn match       tptpConnective  "<="
syn match       tptpConnective  "<=>"
syn match       tptpConnective  "<\~>"
syn match       tptpConnective  "!"
syn match       tptpConnective  "?"
syn match       tptpConnective  "!>"
syn match       tptpConnective  "!="
syn match       tptpConnective  "\~"
syn match       tptpConnective  "\."
syn match       tptpConnective  "\*"
syn match       tptpConnective  ">"

syn match       tptpVar         "\<\u\w*\>"

" errors

"syn match       tptpBraceError  "\]"
"syn match       tptpParenError  ")"

" delimiters

syn region      tptpParen       matchgroup=tptpDelim start="("  end=")" contains=ALLBUT,tptpParenError keepend contained
syn region      tptpParen       matchgroup=tptpDelim start="\[" end="\]" contains=ALLBUT,tptpBraceError keepend contained

syn keyword	tptpTodo	contained TODO BUG FIX

syn region      tptpComment	start=+/\*+ end=+\*/+ contains=tptpTodo
syn match       tptpComment     contains=TODO +%.*+

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tptp_syntax_inits")
  if version < 508
    let did_tptp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tptpTodo               Todo

  HiLink tptpComment		Comment
  HiLink tptpComment		Comment

  HiLink tptpRole               Keyword
  HiLink tptpLogic              Keyword
  HiLink tptpConnective         Keyword
  HiLink tptpDelim              Delimiter

  HiLink tptpDollar             String
  HiLink tptpDollarDollar       String
  HiLink tptpQuote              String
  HiLink tptpDoubleQuote        String

  HiLink tptpVar                Constant

  HiLink tptpBraceError         Error
  HiLink tptpParenError         Error

  delcommand HiLink
end

let b:current_syntax = "tptp"

" vim: ts=8 sw=8
