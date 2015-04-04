if exists("g:loaded_neovimux") || &cp
  finish
endif
let g:loaded_neovimux = 1

if !exists("g:neovimux_split_vertical")
  let g:neovimux_split_vertical = 0
endif

command! -nargs=1 NeovimuxRunCommand :call neovimux#RunCommand(<args>)
