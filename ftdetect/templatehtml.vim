fun s:SelectHtml()
    let lineIndex = 1
    while lineIndex < 20 && lineIndex <= line("$")
        if getline(lineIndex) =~ '{{.*}}\|<%.*%>'
            set filetype=templatehtml
        endif
        let lineIndex = lineIndex + 1
    endw
endfun

autocmd BufNewFile,BufRead *.html,*.htm call s:SelectHtml()
