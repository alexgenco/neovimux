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

command! -nargs=1 NeovimuxRun         :call neovimux#Run(<args>)
command! -nargs=0 NeovimuxFocus       :call neovimux#Focus(1)
command! -nargs=0 NeovimuxFocusNormal :call neovimux#Focus(0)
command! -nargs=0 NeovimuxClose       :call neovimux#Close()
command! -nargs=0 NeovimuxRunLast     :call neovimux#RunLast()
