if !exists("g:neovimux_split_vertical")
  let g:neovimux_split_vertical = 0
endif

function! CreateTerminalSplit(vertical)
  let termbuff = "term://" . &shell

  if a:vertical
    execute "vsplit " . termbuff
  else
    execute "split " . termbuff
  endif

  call RegisterTerminalWindow()
endfunction

function! RegisterTerminalWindow()
  let g:neovimux_terminal_buffer = bufnr("%")

  setlocal nohidden

  autocmd! * <buffer>
  autocmd! BufDelete <buffer> :unlet g:neovimux_terminal_buffer

  wincmd p
endfunction

function! RunCommandInTerminal(cmd)
  if !exists("g:neovimux_terminal_buffer")
    call CreateTerminalSplit(g:neovimux_split_vertical)
  endif

  let prev_window = winnr()

  call MoveToTerminalWindow()
  execute "normal! i" . a:cmd . ""
  wincmd p
endfunction

function! MoveToTerminalWindow()
  let term_window = bufwinnr(g:neovimux_terminal_buffer)
  execute term_window . "wincmd w"
endfunction
