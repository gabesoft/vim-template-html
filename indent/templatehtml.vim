if exists("b:did_indent")
    finish
endif

if expand("%:e") =~ 'html'
    runtime! indent/html.vim
endif

setlocal indentkeys=o,O,<>>,!^F
