function! neovimux#RunCommand(cmd) abort
  if !exists("g:neovimux_terminal_buffer")
    call neovimux#OpenTerminal()
  endif

  let prev_window = winnr()

  call neovimux#FocusTerminal()
  execute "normal! i" . a:cmd . ""
  wincmd p
endfunction

function! neovimux#OpenTerminal() abort
  let termbuff = "term://" . g:neovimux_shell

  if g:neovimux_split_vertical
    execute "botright " . g:neovimux_split_size . "vsplit " . termbuff
  else
    execute "botright " . g:neovimux_split_size . "split " . termbuff
  endif

  call s:initialize_terminal_buffer()
  wincmd p
endfunction

function! neovimux#FocusTerminal() abort
  if s:has_open_terminal()
    let term_window = bufwinnr(g:neovimux_terminal_buffer)
    execute term_window . "wincmd w"
  endif
endfunction

function! neovimux#CloseTerminal() abort
  if s:has_open_terminal()
    execute "bdelete! " . g:neovimux_terminal_buffer
  endif
endfunction

function! s:has_open_terminal() abort
  if !exists("g:neovimux_terminal_buffer")
    return 0
  end

  if bufwinnr(g:neovimux_terminal_buffer) == -1
    return 0
  endif

  return 1
endfunction

function! s:initialize_terminal_buffer() abort
  let g:neovimux_terminal_buffer = bufnr("%")

  setlocal nohidden

  autocmd! * <buffer>
  autocmd! BufDelete <buffer> :unlet g:neovimux_terminal_buffer
endfunction
