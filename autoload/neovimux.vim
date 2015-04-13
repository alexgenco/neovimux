function! neovimux#Run(cmd) abort
  let source_window = winnr()

  if exists("g:neovimux_terminal_window")
    call s:move_to_terminal()
  else
    call s:open_terminal(1)
  endif

  execute "normal! i" . a:cmd . ""
  execute source_window . "wincmd w"
endfunction

function! neovimux#Focus(insert_mode) abort
  if exists("g:neovimux_terminal_window")
    call s:move_to_terminal()
  else
    call s:open_terminal(1)
  endif

  if a:insert_mode
    startinsert
  endif
endfunction

function! neovimux#Close() abort
  if exists("g:neovimux_terminal_buffer")
    execute "bdelete! " . g:neovimux_terminal_buffer
  endif
endfunction

function! s:open_terminal(move_focus) abort
  let termbuff = "term://" . g:neovimux_shell

  if g:neovimux_split_vertical
    execute "botright " . g:neovimux_split_size . "vsplit " . termbuff
  else
    execute "botright " . g:neovimux_split_size . "split " . termbuff
  endif

  let g:neovimux_terminal_buffer = bufnr("%")
  let g:neovimux_terminal_window = winnr()

  setlocal nohidden
  autocmd BufDelete <buffer> :unlet g:neovimux_terminal_buffer g:neovimux_terminal_window

  if !a:move_focus
    wincmd p
  endif
endfunction

function! s:move_to_terminal() abort
  execute g:neovimux_terminal_window . "wincmd w"
endfunction
