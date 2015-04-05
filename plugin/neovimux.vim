if exists("g:loaded_neovimux") || !has("nvim") || &cp
  finish
else
  let g:loaded_neovimux = 1
endif

if !exists("g:neovimux_split_vertical")
  let g:neovimux_split_vertical = 0
endif

if !exists("g:neovimux_split_size")
  let g:neovimux_split_size = 10
endif

if !exists("g:neovimux_shell")
  let g:neovimux_shell = &shell
endif

command! -nargs=1 NeovimuxRunCommand    :call neovimux#RunCommand(<args>)
command! -nargs=0 NeovimuxOpenTerminal  :call neovimux#OpenTerminal()
command! -nargs=0 NeovimuxFocusTerminal :call neovimux#FocusTerminal()
command! -nargs=0 NeovimuxCloseTerminal :call neovimux#CloseTerminal()
