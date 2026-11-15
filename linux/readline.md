# Edit mode to emacs.
set -o emacs

# Edit mode to vi.
set -o vi

# End of line
ctrl-e

# Start of line
ctrl-a

# Edit using default editor
ctrl-x ctrl-e

# Delete word backward
ctrl-w

# Delete until end
ctrl-k


Cursor Movement


Shortcut	Action
Ctrl + A	Move to the start of the line
Ctrl + E	Move to the end of the line
Alt + B	Move back one word
Alt + F	Move forward one word
Ctrl + B / Ctrl + F	Move back / forward one character (same as Left/Right arrows)
Ctrl + XX	Toggle cursor between current position and start of line


Cutting & Pasting (Killing & Yanking)

Text deleted with Ctrl or Alt shortcuts is saved to Readline's internal clipboard ("kill ring") so you can paste it back.

Shortcut	Action
Ctrl + U	Cut from cursor to the start of the line
Ctrl + K	Cut from cursor to the end of the line
Ctrl + W	Cut the word before the cursor (separated by spaces)
Alt + D	Cut the word after the cursor
Alt + Backspace	Cut the word before the cursor (stops at punctuation/slashes)
Ctrl + Y	Paste (yank) the most recently cut text
Alt + Y	Cycle through earlier cut text (use immediately after Ctr


Editing & Case Formatting


Shortcut	Action
Ctrl + _	Undo the last edit
Ctrl + T	Swap (transpose) the character before the cursor with the one under it
Alt + T	Swap the word before the cursor with the word under/after it
Alt + U	Uppercase from cursor to end of word
Alt + L	Lowercase from cursor to end of word
Alt + C	Capitalize the character under the cursor and move to end of word


Command History & Screen


Shortcut	Action
Ctrl + R	Reverse-search command history (press Ctrl + R again to cycle matches)
Ctrl + G	Cancel history search and return to your current prompt
Ctrl + P / Ctrl + N	Previous / Next command in history (same as Up/Down arrows)
Alt + .	Insert the last argument of the previous command
Ctrl + L	Clear the screen (keeps your current command line intact)


Command History & Screen


Shortcut	Action
Ctrl + R	Reverse-search command history (press Ctrl + R again to cycle matches)
Ctrl + G	Cancel history search and return to your current prompt
Ctrl + P / Ctrl + N	Previous / Next command in history (same as Up/Down arrows)
Alt + .	Insert the last argument of the previous command
Ctrl + L	Clear the screen (keeps your current command line intact)


