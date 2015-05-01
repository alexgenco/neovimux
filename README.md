# Neovimux

A small wrapper around Neovim's built-in terminal emulation.

Current commands:

```vim
:NeovimuxRun "my command" " Run the provided command in a terminal buffer
:NeovimuxRunLast          " Run the last command
:NeovimuxClose            " Close the terminal buffer
:NeovimuxFocus            " Focus on the terminal buffer and enter insert mode
:NeovimuxFocusNormal      " Focus on the terminal buffer without entering insert mode
