jf exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim

syntax case match

syn region templateVarBlock matchgroup=templateVarDelim start=/{{\s\?/ end=/\s\?}}/ containedin=ALLBUT,templateVarBlock,templateTagBlock contains=templateStatement,templateString,templateFunction,templateRepeat,templateConditional,templateOperator,templateInclude,templateAsync,templateNumber
syn region templateTagBlock matchgroup=templateTagDelim start=/<%\s\?/ end=/\s\?%>/ containedin=ALLBUT,templateVarBlock,templateTagBlock contains=templateStatement,templateString,templateFunction,templateRepeat,templateConditional,templateOperator,templateInclude,templateAsync,templateNumber
syn match templateTagEnd /<\/%>/
syn match templateCompositionTagName contained /[-_a-zA-Z0-9]\+\(:[-_a-zA-Z0-9]\+\)\+/
syn region templateCompositionTag start=/<[^% <>]\+:/ end=/>/ contains=templateCompositionTagName,templateString,templateNumber
syn keyword templateConditional contained elif else if
syn keyword templateStatement contained while set cdata required optional
syn keyword templateStatement contained False None True
syn keyword templateStatement contained as assert break continue del exec global
syn keyword templateStatement contained lambda nonlocal pass print return with yield
syn keyword templateStatement contained class def nextgroup=templateFunction skipwhite
syn keyword templateRepeat contained for while in
syn keyword templateOperator contained and in is not or
syn keyword templateException contained except finally raise try
syn keyword templateInclude contained from import
syn keyword templateAsync contained async await
syn match templateFunction contained "\h\w*" display

syn region templateString contained start=/"/ skip=/\(\\\)\@<!\(\(\\\\\)\@>\)*\\"/ end=/"/
syn region templateString contained start=/'/ skip=/\(\\\)\@<!\(\(\\\\\)\@>\)*\\'/ end=/'/
syn match templateNumber "\<0[oO]\=\o\+[Ll]\=\>"
syn match templateNumber "\<0[xX]\x\+[Ll]\=\>"
syn match templateNumber "\<0[bB][01]\+[Ll]\=\>"
syn match templateNumber "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match templateNumber "\<\d\+[jJ]\>"
syn match templateNumber "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match templateNumber "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match templateNumber "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

hi def link templateVarDelim templateVarBlock
hi def link templateTagDelim templateTagBlock
hi def link templateTagEnd templateTagBlock

hi def link templateVarBlock PreProc
hi def link templateTagBlock PreProc
hi def link templateCompositionTag Normal
hi def link templateStatement Statement
hi def link templateConditional Conditional
hi def link templateString Constant
hi def link templateRepeat Repeat
hi def link templateOperator Operator
hi def link templateException Exception
hi def link templateAsync Statement
hi def link templateInclude Include
hi def link templateFunction Function
hi def link templateNumber Number

hi def templateCompositionTagName gui=bold term=bold cterm=bold

let b:current_syntax = 'templatehtml'
