function ReactFunctionComponent(name)
  :-1read ~/dotfiles/vim/templates/react-function.ts
  execute "%s/Name/" . a:name . "/g"
  execute "normal gg"
  execute "normal 6kA"
endfunction

command! -nargs=1 RComponent :call ReactFunctionComponent(<f-args>)
