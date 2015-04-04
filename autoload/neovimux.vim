function! neovimux#RunCommand(cmd) abort
  if !exists("g:neovimux_terminal_buffer")
    call s:create_terminal_split(g:neovimux_split_vertical)
  endif

  let prev_window = winnr()

  call s:move_to_terminal_window()
  execute "normal! i" . a:cmd . ""
  wincmd p
endfunction

function! s:create_terminal_split(vertical) abort
  let termbuff = "term://" . &shell

  if a:vertical
    execute "vsplit " . termbuff
  else
    execute "split " . termbuff
  endif

  call s:register_terminal_buffer()
endfunction

function! s:register_terminal_buffer() abort
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
