<C-x>,<C-e>
  Edit command line on vim.

cat /etc/shells
  List available shells.

echo $SHELL
  Show current shell in use.

zsh --version
  Show version.

chsh -s $(which zsh)
  Change default shell to zsh.

print -P %d
  Print value of %d (prompt expasion).

alias
  Show current alias.

strings =zsh | grep zshrc
  Check for global configurations.
  strings
    Print the strings of printable characters in files (binary).

$d
$/
  The current directory (%PWD).

$~
  The current directory, but change /home/user by ~.

%c
%.
  Trailing component of $PWD. If you want n tailing componenets, put an interger 'n' after the %.

%C
  Just like %c and %. except that ~'s are never displayed in place of directory names.

%M
  The full machine hostname

%m
  The hostname up to the first . (dot). An integer may follow the % to specify how many components of the hostname are desired.

%n
  Equivalent to $USERNAME.

%l
  The line (tty) the user is logged in on.

%?
  The return code of the last command executed just before the prompt.

%#
  A `#' if the shell is running with privileges, a `%' if not. The definition of privileged, for these purposes, is that either the effective user ID is zero, or, if POSIX.1e capabilities are supported, that at least one capability is raised in either the Effective or Inheritable capability vectors.

%{...%}
  Include a string as a literal escape sequence.
  The string within the braces should not change the cursor position.
  Brace pairs can nest. This can be used to put color in your prompt.

%U
  Start underline mode

%u
  Stop underline mode

%B
  Start boldface mode

%b
  Stop boldface mode

%S
  Start standout mode

%s
  Stop standout mode

%(X.true-text.false-text)
%(?.ok.fail)
  Conditional prompt
  ? ture if the exit status of the last command was 0
