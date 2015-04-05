function! neovimux#RunCommand(cmd) abort
  if !exists("g:neovimux_terminal_buffer")
    call s:create_terminal_buffer()
  endif

  let prev_window = winnr()

  call s:move_to_terminal_window()
  execute "normal! i" . a:cmd . ""
  wincmd p
endfunction

function! s:create_terminal_buffer() abort
  let termbuff = "term://" . g:neovimux_shell

  if g:neovimux_split_vertical
    execute g:neovimux_split_size . "vsplit " . termbuff
  else
    execute g:neovimux_split_size . "split " . termbuff
  endif

  call s:initialize_terminal_buffer()
endfunction

function! s:initialize_terminal_buffer() abort
  let g:neovimux_terminal_buffer = bufnr("%")

  setlocal nohidden

  autocmd! * <buffer>
  autocmd! BufDelete <buffer> :unlet g:neovimux_terminal_buffer

  wincmd p
endfunction

function! s:move_to_terminal_window() abort
  let term_window = bufwinnr(g:neovimux_terminal_buffer)
  execute term_window . "wincmd w"
endfunction
