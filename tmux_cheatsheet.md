# Tmux Cheatsheet (customized)

## General
- `tmux new-session` Create new session
- `tmux attach-session` Attach to an existing session
- `tmux switch -t <session-name>` Switch to a specific session
- `tmux list-sessions` List all sessions
- `tmux detach-client` Detach from a session without killing it

## Windows
- `c-a c-c` Create new window
- `c-a c-w` Choose window from a list
- `c-a n` Next window
- `c-a p` Previous window
- `c-a l` Last window used
- `c-a &` Kill current window
- `c-a ,` Rename current window
- `c-a .` Move current window to specified index

## Panes
- `c-a -` Split current pane horizontally
- `c-a |` Split current pane vertically
- `c-a arrow keys` Move between panes
- `c-a x` Kill current pane
- `c-a q` Show pane numbers
- `c-a {` Move current pane left
- `c-a }` Move current pane right

## Copy Mode
- `c-a [` Enter copy mode
- `v` Start selection
- `y` Copy selection
- `C-space` Start selection (alternative)
- `M-w` Copy selection (alternative)

## Miscellaneous
- `c-a ?` List all keybindings
- `c-a :` Enter command prompt
- `c-a d` Detach from current session
- `c-a t` Show clock
