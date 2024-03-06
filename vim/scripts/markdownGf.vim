function! MarkdownGF()
    " Get the filename under the cursor
    let cfile=expand('<cfile>')
    " Separate the filename from the section
    let parts=split(cfile, '#')

    " No section marked
    if (len(parts) == 1)
        execute "normal! gf"
    " There was a subsection in the file name
    else
        execute "e " . parts[0]
        let lineNumber=matchstr(parts[1], 'L\d\+')
        if (lineNumber != "")
            let cleanLineNumber=matchstr(lineNumber, '\d\+')
            execute "normal" . cleanLineNumber ."G"
        else
            let pattern = "^" . repeat('\#',len(parts)-1) . "\\\s*" . parts[len(parts)-1] . "$"
            call search(pattern, 'w')
        endif
    endif
endfunction

command! -nargs=0 Gf :call MarkdownGF()
