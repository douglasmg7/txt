Ctrl-b c Create new window
Ctrl-b d Detach current client
Ctrl-b l Move to previously selected window
Ctrl-b n Move to the next window
Ctrl-b p Move to the previous window
Ctrl-b & Kill the current window
Ctrl-b , Rename the current window
Ctrl-b % Split vertical
Ctrl-b " Split horizontal
Ctrl-b q Show pane numbers (used to switch between panes)
Ctrl-b o Switch to the next pane
Ctrl-b ? List all keybindings
Ctrl-b w (List all windows / window numbers)

ctrl-b ctr-arrow - resize panes
ctrl-b arrow - change pane

ctrl-b [ Scroll mode
q		 Quit scroll mode

# list sessions
tmux ls

# attach to session 0
tmux attach -t 0

# create a new session with the name database
tmux new -s database

# rename existing session
tmux rename-change -t 0 database

# full screen a pane
prefix z
