function AddNewCard(name)
  execute "e %:h/" . a:name . ".md"
endfunction

command! -nargs=1 Ficha :call AddNewCard(<f-args>)
