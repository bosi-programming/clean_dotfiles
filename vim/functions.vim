function TodoQuickfix()
  execute ":vimgrep /TODO/g %:h/**/*"
endfunction

command! -nargs=0 Todo :call TodoQuickfix()
