# Bourne Again Shell - bash
# a shell program

# shell is a user program or it's environment provided for user interaction. Shell is an command language interpreter that executes commands read from the standard input device (keyboard) or from a file.
# shell is not part of system kernel, but uses the system kernel to execute programs, create files etc

# process
# When you "run" or "execute" a program, your kernel loads its pre-written instructions (its code) by creating a process for your program to work in.
# Your program can run many times simultaneously, each of those instances are running processes of your program.
# A process also has a few hooks to the outside world via something called file descriptors.
# These are essentially plugs we use to connect processes to files, devices or other processes.
# File descriptors are identified by numbers, though the first three also have standard names:
# 	standard input
# 		File descriptor 0
# 	standard output
# 		File descriptor 1
# 	standard error
# 		File descriptor 2

# Interactive
# As the term implies: Interactive means that the commands are run with user-interaction from keyboard. E.g. the shell can prompt the user to enter input.
# A shell (login or non-login) where you can interactively type or interrupt commands. For example a gnome terminal (non-login) or a virtual terminal (login). In an interactive shell the prompt variable must be set ($PS1). Sourced files:
# /etc/profile and ~/.profile
# /etc/bashrc or /etc/bash.bashrc for bash

# Non-interactive
# the shell is probably run from an automated process so it can't assume if can request input or that someone will see the output. E.g Maybe it is best to write output to a log-file.
# non-interactive shell: A (sub)shell that is probably run from an automated process you will see neither input nor outputm when the calling process don't handle it. That shell is normally a non-login shell, because the calling user has logged in already. A shell running a script is always a non-interactive shell, but the script can emulate an interactive shell by prompting the user to input values. Sourced files:
# /etc/bashrc or /etc/bash.bashrc for bash (but, mostly you see this at the beginning of the script: [ -z "$PS1" ] && return. That means don't do anything if it's a non-interactive shell)
# depending on shell; some of them read the file in the $ENV variable

#Login 
# Means that the shell is run as part of the login of the user to the system. Typically used to do any configuration that a user needs/wants to establish his work-environment.
# A login shell logs you into the system as a spiecified user, necessary for this is a username and password. When you hit ctrl+alt+F1 to login into a virtual terminal you get after successful login: a login shell (that is interactive). Sourced files:
# /etc/profile and ~/.profile for Bourne compatible shells (and /etc/profile.d/*)
# ~/.bash_profile for bash
# /etc/zprofile and ~/.zprofile for zsh
# /etc/csh.login and ~/.login for csh
# ps show -bash (dash before bash in login shell)

# Non-login 
# Any other shell run by the user after logging on, or which is run by any automated process which is not coupled to a logged in user.
# A shell that is executed without logging in, necessary for this is a current logged in user. When you open a graphic terminal in gnome it is a non-login (interactive) shell. Sourced files:
# /etc/bashrc and ~/.bashrc for bash

# bash command help
help read 	# show help for command read

# run a bash script
chmod + script.txt
bash script.txt
./script.txt

# which shell
echo $SHELL

# find all available shells
cat /etc/shells

# /bin/usr/env
# It's a program that can find and start other programs

# hashbang / shebang
# it is important to use, for compatibility
#!/usr/bin/env bash
#!/bin/env bash

# how long take to run the command
time ls

# The bash executable
/bin/bash

# The systemwide initialization file, executed for login shells
/etc/profile
/etc/profile.d/*

# The personal initialization file, executed for login shells
~/.bash_profile

# The individual per-interactive-shell startup file
/etc/bashrc
~/.bashrc

# The individual login shell cleanup file, executed when a login shell exits
~/.bash_logout

# Individual readline initialization file
~/.inputrc

# read by a shell that's both interactive and non-login (ex: terminal gui)
~/.bash_profile
# if ~/.bash_profile not exist look for 
# .profile is simply the login script filename originally used by /bin/sh. bash, being generally backwards-compatible with /bin/sh, will read .profile if one exists.
~/.profile
# most people end up telling their .bash_profile to also read .bashrc with something like
[[ -r ~/.bashrc ]] && . ~/.bashrc

# generic shell profile configuration file (POSIX sh syntax not bash-specific shell syntax)
~/.profile
~/.bashrc

# conncect fd1 and fd2 from cmd_a to cmd_b
cmd_a |& cmd_b

# bash commands
	# functions - are previously declared blocks of commands that were given a name
	# builtin - are tiny procedures built into bash
	# program - also called an external command (ls, sort, etc...)

# show where bash find the program
type ping
type echo
type -a node 	# show all node app present

# including home directory into path
PATH=$PATH:~

# bash version
echo $BASH_VERSION
bash --version

# make characters literal
""	- # for any argument that contains expansions (such as $variable or $(command) expansions)
''  - # for any other arguments - single quotes make sure that everything in the quotes remains literal
\	  - # in front of the character that we want to make literal

# avoid mistakes with commands without quoting
a=' log'
rm /home/$a 		# mistake - remove /home/ and log
rm "/home/$a" 	# error message - try to remove '/home/ log'

# empty device
# files that represent devices in our system
# we're communicating directly with those devices through the kernel
# null device is a special device that is always empty
# anything you write to it will be lost and nothing can be read from it
/dev/null

# redirection
>		# input
1>	# output
2>	# error
ls -l a b >out.txt	# error to display, result to out.txt
ls -l a b >out.txt 2>/dev/null	# error to file /dev/null , result to out.txt
ls -l a b >out.txt 2>out.txt		# wrong - mix the output
ls -l a b >out.txt 2>&1					# correct - 2>&1 as make FD 2 write(>) to where FD(&) 1 is currently writing
ls -l a b 2>&1 >output.txt			# error - 2>&1 point to display, because &1 still point to display when configured (left to right)
ping 127.0.0.1 >>result 				# append
ping 127.0.0.1 &>results				# truncate - make both FD 1 (standard output) and FD 2 (standard error) write to file
ping 127.0.0.1 &>>results				# append - make both FD 1 (standard output) and FD 2 (standard error) write to file
[x]>&-		# stream is disconnected from file descriptor x and the file descriptor is removed from the process
[x]<&-		# stream is disconnected from file descriptor x and the file descriptor is removed from the process
[x]>&y-, [x]<&y-	# stream is disconnected from file descriptor x and the file descriptor is removed from the process
[x]<>file 	# open FD x for both reading and writing to file

# redirection
cat <<. >>a.txt		# we choose . as the end delimiter
Hello world.
Since I started learning bash, you suddenly seem so much bigger than you were before.
.		# Our previously chosen . ends the here-document

# string redirection ""
cat <<<"era" >c.txt

# redirect bash fd
# used to change the file descriptors of bash itself (rather than those of a new command)
# bash will create a new file descriptor ("plug") for you with that number
exec 3>&1

# bash parameters
	# positional parameters
	# special parameters
	# shell variables
	
# shell variable
# parameter that has a name
# Internal shell variables - shell variables with ALL-UPPERCASE names
# you should make all of your own shell variables lower-case to avoid ever accidentally overriding a shell-internal variable of the same name. 
# If you create an environment variable, give it an ALL-UPPERCASE name.

# assign the value blue to the variable color
color=blue
# run the command color with argument "=" and "blue"
color = blue

# assign
greeting="$greeting world"
greeting+=" world"

# expand the value of color into the echo argument
# expansion is done by prefixing the name with a $ symbol
echo $color
echo ${color}

# Shell variable are stored inside the bash
# Environment variables are variables stored on your process
		# When you run a new program from the shell, bash will run this program in a new process. When it does, this new process will have its own environment. But unlike shell processes, ordinary processes do not have shell variables. They only have environment variables. More importantly, when a new process is created, its environment is populated by making a copy of the environment of the creating process
# It is a common misconception that the environment is a system-global pool of variables that all processes share. This illusion is often the result of seeing the same variables available in child processes. When you create a custom environment variable in the shell, any child processes you create afterwards will inherit this variable as a result of it being copied from your shell into the child's environment. However, since the environment is specific to each process, changing or creating new variables in the child will in no way affect the parent

name=Britta time=23.73	# We want to expand time and add an s for seconds
echo "$name's current record is $times."	# but bash mistakes the name for times which holds nothing
# Britta's current record is .
echo "$name's current record is ${time}s."	# Braces explicitly tell bash where the name ends
# Britta's current record is 23.73s.

# expandion operators
name=Britta time=23.73
echo "$name's current record is ${time%.*} seconds and ${time#*.} hundredths."
# Britta's current record is 23 seconds and 73 hundredths.
echo "PATH currently contains: ${PATH//:/, }"
# PATH currently contains: /Users/lhunath/.bin, /usr/local/bin, /usr/bin, /bin, /usr/libexec
# "%" remove to end
# "#" remove from begin
# "//" replace

# Remove the shortest string that matches the pattern if it's at the start of the value.
${parameter#pattern}	
"${url#*/}"	
http://guide.bash.academy/variables.html
/guide.bash.academy/variables.html

# Remove the longest string that matches the pattern if it's at the start of the value.
${parameter##pattern}	
"${url##*/}"	
http://guide.bash.academy/variables.html
variables.html

# Remove the shortest string that matches the pattern if it's at the end of the value.
${parameter%pattern}	
"${url%/*}"	
http://guide.bash.academy/variables.html
http://guide.bash.academy

# Remove the longest string that matches the pattern if it's at the end of the value.
${parameter%%pattern}	
"${url%%/*}"	
http://guide.bash.academy/variables.html
http:

# Replace the first string that matches the pattern with the replacement.
${parameter/pattern/replacement}	
"${url/./-}"	
http://guide.bash.academy/variables.html
http://guide-bash.academy/variables.html

# Replace each string that matches the pattern with the replacement.
${parameter//pattern/replacement}	
"${url//./-}"	
http://guide.bash.academy/variables.html
http://guide-bash-academy/variables-html

# Replace the string that matches the pattern at the beginning of the value with the 
${parameter/#pattern/replacement}	
"${url/#*:/https:}"	
http://guide.bash.academy/variables.html
https://guide.bash.academy/variables.html

# Replace the string that matches the pattern at the end of the value with the replacement.
${parameter/%pattern/replacement}	
"${url/%.html/.jpg}"	
http://guide.bash.academy/variables.html
http://guide.bash.academy/variables.jpg

# Expand the length of the value (in bytes)
# ${#parameter}	
"${#url}"	
http://guide.bash.academy/variables.html
40

# Expand a part of the value, starting at start, length bytes long.
# ${parameter:start[:length]}	
"${url:7}"	
http://guide.bash.academy/variables.html
guide.bash.academy/variables.html

# Expand the transformed value, either upper-casing or lower-casing the first or all characters that match the pattern. You can omit the pattern to match any character.
# ${parameter[^|^^|,|,,][pattern]}
"${url^^[ht]}"	
http://guide.bash.academy/variables.html
HTTp://guide.basH.academy/variables.HTml

# make the shell variable color a environment variable
export color

# unmake col or global
unset color

# positional parameters
$1
$3
${12}
grep Name resgistrations.txt
# If grep were a bash script, the first argument would be available in the script by expanding $1 and the second argument by expanding $2. Positional parameters higher than 2 will be unset
# It's good to know that there is also a zero'th positional parameter. This positional parameter expands to the name of the process

# set positional parameters
set -- 'first argument' second third 'fourth argument'
# -- instructs set to replace the command line parameter variables with the values on the set command’s command line.
echo $1; echo $2; echo $3; echo $4

# New First Argument Second Third Fourth Argument
$ shift 2 	# Push the positional parameters back 2.
# Third Fourth Argument <----The first two disappeared and the third is now in first spot with the fourth in second place.

bash -c 'echo "1: $1, 2: $2, 4: $4"' -- 'New First Argument' Second Third 'Fourth Argument'
# 1: New First Argument, 2: Second, 4: Fourth Argument

# special parameters
$*, $@, $# etc..

"$*"	
echo "Arguments: $*"
# Takes all the parameters supplied on the command line as a single word.
# Expands a single string, joining all positional parameters into one, separated by the first character in IFS (by default, a space).
# Note: You should never use this parameter unless you explicitly intend to join all the parameters. You almost always want to use @ instead.

"$@"	
rm "$@"	
# Takes all the parameters supplied on the command line as separate words in the same string.
# Expands the positional parameters as a list of separate arguments.
bash -c 'echo "${@: -1}"' -- 1 2 'The Third'
# The Third

"$#"	
echo "Count: $#"	
# Expands into a number indicating the amount of positional parameters that are available.

${!#}
# Expands to the last parameter

"$?"	
(( $? == 0 )) || echo "Error: $?"		
# Expands the exit code of the last (synchronous) command that just finished.
# An exit code of 0 indicates the command succeeded, any other number indicates why the command failed.

"$-"	
[[ $- = *i* ]]	
# Expands to the set of option flags that are currently active in the shell.
# Option flags configure the behaviour of the shell, the example tests for the presence of the i flag, indicating the shell is interactive (has a prompt) and is not running a script.

"$$"	
echo "$$" > /var/run/myscript.pid	
# Expands a number that's the unique process identifier for the shell process (that's parsing the code).

"$!"	
kill "$!"	
# Expands a number that's the unique process identifier of the last process that was started in the background (asynchronously).
# The example signals the background process that it's time to terminate.

"$_"	
mkdir -p ~/workspace/projects/myscripts && cd "$_"	
# Expands to the last argument of the previous command.

# execute the comand between back quote `
echo "A data é `date`"

# write user input do variable tmp
read tmp

# to use escape sequence
printf "Oi\nBeleza\n"

# end of file
ctrl-d

# create a alias name
alias l='ls -l'

# if <test> true, the command <command> is executed
[<test>] && <command>

# if <test> true, the command <command> is not executed
[<test>] || <command>

# show flags that determine how your shell will function
echo $-

# reload profile file
source ~/.bash_profile

export PS1=">> "
PS1 is a variable that defines the makeup and style of the command prompt

env
list of the environment variable of current user

# prompt
read -p 'What is your name?' <var_name>
-p prompt message

# control operator
&& || ','
cmd_a; cmd_b	# start a new line, run the command and wait for it to end before advancing to the next command in the list 
cmd_a || cmd_b	# run the command before it as it normally would, but after finishing that command move to the next command only if the command before it failed
rm file || { echo 'Could not remove file' >&2; exit 1; }
# every command return an exit code, 0 = no error
mkdir d && cd d 	# only run the next command if the first return no error

# if-else-command
if [ $a = $b ]
then echo 'a is the same as b'
elif [ $a -gt $b ] 'a is big than b'
else echo 'a is small than as b'
fi

# expansion a='era um' b='era dois' 
[[ $a = $b ]] = [[ 'era um' = 'era dois' ]]
[ "$a" = "$b" ] = [ 'era um' = 'era dois' ]
[ $a = $b ] = [ era um = era dois ]

# pattern match
[[ file_name = *.png]]

# pattern match
$ foo=[a-z]* name=lhunath
$ [[ $name = $foo   ]] && echo "Name $name matches pattern $foo"
# Name lhunath matches pattern [a-z]*
$ [[ $name = "$foo" ]] || echo "Name $name is not equal to the string $foo"
# Name lhunath is not equal to the string [a-z]*
# The first test checks whether $name matches the pattern in $foo. The second test checks whether $name is equal to the string in $foo. The quotes really do make that much difference -- a subtlety worth noting.

# Tests supported by [ (also known as test):
# -e FILE: True if file exists.
# -f FILE: True if file is a regular file.
# -d FILE: True if file is a directory.
# -h FILE: True if file is a symbolic link.
# -p PIPE: True if pipe exists.
# -r FILE: True if file is readable by you.
# -s FILE: True if file exists and is not empty.
# -t FD : True if FD is opened on a terminal.
# -w FILE: True if the file is writable by you.
# -x FILE: True if the file is executable by you.
# -O FILE: True if the file is effectively owned by you.
# -G FILE: True if the file is effectively owned by your group.
# FILE -nt FILE: True if the first file is newer than the second.
# FILE -ot FILE: True if the first file is older than the second.
# -z STRING: True if the string is empty (it's length is zero).
# -n STRING: True if the string is not empty (it's length is not zero).
# String operators:
	# STRING = STRING: True if the first string is identical to the second.
	# STRING != STRING: True if the first string is not identical to the second.
	# STRING < STRING: True if the first string sorts before the second.
	# STRING > STRING: True if the first string sorts after the second.
	# EXPR -a EXPR: True if both expressions are true (logical AND).
	# EXPR -o EXPR: True if either expression is true (logical OR).
	# ! EXPR: Inverts the result of the expression (logical NOT).
# Numeric operators:
	# INT -eq INT: True if both integers are identical.
	# INT -ne INT: True if the integers are not identical.
	# INT -lt INT: True if the first integer is less than the second.
	# INT -gt INT: True if the first integer is greater than the second.
	# INT -le INT: True if the first integer is less than or equal to the second.
	# INT -ge INT: True if the first integer is greater than or equal to the second.
# Additional tests supported only by [[:
	# STRING = (or ==) PATTERN: Not string comparison like with [ (or test), but pattern matching is performed. True if the string matches the glob pattern.
	# STRING != PATTERN: Not string comparison like with [ (or test), but pattern matching is performed. True if the string does not match the glob pattern.
	# STRING =~ REGEX: True if the string matches the regex pattern.
	# ( EXPR ): Parentheses can be used to change the evaluation precedence.
	# EXPR && EXPR: Much like the '-a' operator of test, but does not evaluate the second expression if the first already turns out to be false.
	# EXPR || EXPR: Much like the '-o' operator of test, but does not evaluate the second expression if the first already turns out to be true.

# ex:
test -e /etc/X11/xorg.conf && echo 'Your Xorg is configured!'
# Your Xorg is configured!

# Whenever you're making a Bash script, you should always use [[ rather than [. 
# Whenever you're making a Shell script, which may end up being used in an environment where Bash is not available, you should use [, because it is far more portable. (While being built in to Bash and some other shells, [ should be available as an external application as well; meaning it will work as argument to, for example, find's -exec and xargs.) 
# Don't ever use the -a or -o tests of the [ command. Use multiple [ commands instead (or use [[ if you can). POSIX doesn't define the behavior of [ with complex sets of tests, so you never know what you'll get.

# while loop
$ while true
do echo "Infinite loop"
done

# while loop
while ! ping -c 1 -W 1 1.1.1.1; do
echo "still waiting for 1.1.1.1"
sleep 1
done

#synonym for test
[]

" "
# Whitespace — this is a tab, newline, vertical tab, form feed, carriage return, or space. Bash uses whitespace to determine where words begin and end. The first word is the command name and additional words become arguments to that command.

$
# Expansion — introduces various types of expansion: parameter expansion (e.g. $var or ${var}), command substitution (e.g. $(command)), or arithmetic expansion (e.g. $((expression))). More on expansions later.

''
# Single quotes — protect the text inside them so that it has a literal meaning. With them, generally any kind of interpretation by Bash is ignored: special characters are passed over and multiple words are prevented from being split.

""
# Double quotes — protect the text inside them from being split into multiple words or arguments, yet allow substitutions to occur; the meaning of most other special characters is usually prevented.

\
# Escape — (backslash) prevents the next character from being interpreted as a special character. This works outside of quoting, inside double quotes, and generally ignored in single quotes.

#
# Comment — an introduction of a # character begins a commentary that extends to the end of the line. Comments are notes of explanation and are not processed by the shell.

[[]]
# Test — an evaluation of a conditional expression to determine whether it is "true" or "false". Tests are used in Bash to evaluate a number of conditions. More of this will be covered later.

!
# Negate — used to negate or reverse a test or exit status. For example: ! grep text file; exit $?.

><
# Redirection — redirect a command's output or input. Redirections will be covered later.

|
# Pipe — redirect output from a initial command to the input of secondary command. This is a method of chaining commands together. Example: echo "Hello beautiful." | grep -o beautiful.

;
# Command separator — a representation of a newline. Used to separate multiple commands that are on the same line.

{}
# Inline group — commands inside the curly braces are treated as if they were one command. It is convenient to use these when Bash syntax requires only one command and a function doesn't feel warranted.

()
# Subshell group — similar to the above but where commands within are executed in subshell. Used much like a sandbox, if a command causes side effects (like changing variables), it will have no effect on the current shell.

(())
# Arithmetic expression — with an arithmetic expression, characters such as +, -, *, and / are mathematical operators used for calculations. They can be used for variable assignments like (( a = 1 + 4 )) as well as tests like if (( a < b )). More on this later.

$(())
# Arithmetic expansion — Comparable to the above, but the expression is replaced with the result of its arithmetic evaluation. Example: echo "The average is $(( (a+b)/2 ))".

~
# Home directory — the tilde is a representation of the home directory. When followed by a /, it means the current user's home directory; otherwise, a username will have to be specified (e.g. ls ~/Documents; cp ~john/.bashrc .).

# shell variable provided
# BASH_VERSION: Contains a string describing the version of Bash.
# HOSTNAME: Contains the hostname of your computer, I swear. Either short or long form, depending on how your computer is set up.
# PPID: Contains the PID of the parent process of this shell.
# PWD: Contains the current working directory.
# RANDOM: Each time you expand this variable, a (pseudo)random number between 0 and 32767 is generated.
# UID: The ID number of the current user. Not reliable for security/authentication purposes, alas.
# COLUMNS: The number of characters that fit on one line in your terminal. (The width of your terminal in characters.)
# LINES: The number of lines that fit in your terminal. (The height of your terminal in characters.)
# HOME: The current user's home directory.
# PATH: A colon-separated list of paths that will be searched to find a command, if it is not an alias, function, builtin command, or shell keyword, and no pathname is specified.
# PS1: Contains a string that describes the format of your shell prompt.
# TMPDIR: Contains the directory that is used to store temporary files (by the shell).

declare -a tmp_var
# Array - The variable is an array of strings.

declare -A tmp_var
# Associative array - The variable is an associative array of strings (bash 4.0 or higher).

declare -i tmp_var
# Integer - The variable holds an integer. Assigning values to this variable automatically triggers Arithmetic Evaluation.

declare -r tmp_var
# Read Only - The variable can no longer be modified or unset.

declare -x variable
# Export - The variable is marked for export which means it will be inherited by any child process.

a=3; a+=3; echo $a
# 33

a=3; let a+=3; echo $a
# 6

# rename file
$ for file in *.JPG *.jpeg
do mv -- "$file" "${file%.*}.jpg"
done

# parameter expansion (PE)
# You may be tempted to use external applications such as sed, awk, cut, perl or others to modify your strings. Be aware that all of these require an extra process to be started, which in some cases can cause slowdowns. Parameter Expansions are the perfect alternative.
${parameter:-word}
# Use Default Value. If 'parameter' is unset or null, 'word' (which may be an expansion) is substituted. Otherwise, the value of 'parameter' is substituted.

${parameter:=word}
# Assign Default Value. If 'parameter' is unset or null, 'word' (which may be an expansion) is assigned to 'parameter'. The value of 'parameter' is then substituted.

${parameter:+word}
# Use Alternate Value. If 'parameter' is null or unset, nothing is substituted, otherwise 'word' (which may be an expansion) is substituted.

${parameter:offset:length}
# Substring Expansion. Expands to up to 'length' characters of 'parameter' starting at the character specified by 'offset' (0-indexed). If ':length' is omitted, go all the way to the end. If 'offset' is negative (use parentheses!), count backward from the end of 'parameter' instead of forward from the beginning. If 'parameter' is @ or an indexed array name subscripted by @ or *, the result is 'length' positional parameters or members of the array, respectively, starting from 'offset'.

${#parameter}
# The length in characters of the value of 'parameter' is substituted. If 'parameter' is an array name subscripted by @ or *, return the number of elements.

${parameter#pattern}
# The 'pattern' is matched against the beginning of 'parameter'. The result is the expanded value of 'parameter' with the shortest match deleted. 
# If 'parameter' is an array name subscripted by @ or *, this will be done on each element. Same for all following items.

${parameter##pattern}
# As above, but the longest match is deleted.

${parameter%pattern}
# The 'pattern' is matched against the end of 'parameter'. The result is the expanded value of 'parameter' with the shortest match deleted.

${parameter%%pattern}
# As above, but the longest match is deleted.

${parameter/pat/string}
# Results in the expanded value of 'parameter' with the first (unanchored) match of 'pat' replaced by 'string'. Assume null string when the '/string' part is absent.

${parameter//pat/string}
# As above, but every match of 'pat' is replaced.

${parameter/#pat/string}
# As above, but matched against the beginning. Useful for adding a common prefix with a null pattern: "${array[@]/#/prefix}".

${parameter/%pat/string}
# As above, but matched against the end. Useful for adding a common suffix with a null pattern.

# pattern
# is a string with a special format designed to match filenames, or to check, classify or validate data strings.
# Since version 3.0, Bash also supports regular expression patterns. These will be useful mainly in scripts to test user input or parse data. (You can't use a regular expression to select filenames; only globs and extended globs can do that.)

# Globs
# patterns that can be used to match filenames or other strings
# Globs are implicitly anchored at both ends. What this means is that a glob must match a whole string (filename or data string). A glob of a* will not match the string cat, because it only matches the at, not the whole string. A glob of ca*, however, would match cat
# When a glob is used to match filenames, the * and ? characters cannot match a slash (/) character. So, for instance, the glob */bin might match foo/bin but it cannot match /usr/local/bin. When globs match patterns, the / restriction is removed.
# You should always use globs instead of ls (or similar) to enumerate files. Globs will always expand safely and minimize the risk for bugs

* 	# Matches any string, including the null string.
? 	# Matches any single character.
[...] 	# Matches any one of the enclosed characters.

# Extended Globs
# Bash also supports a feature called Extended Globs. These globs are more powerful in nature; technically, they are equivalent to regular expressions, although the syntax looks different than most people are used to. This feature is turned off by default, but can be turned on with the shopt command, which is used to toggle shell options:

# enable external glob
shopt -s extglob
?(list)		# Matches zero or one occurrence of the given patterns.
*(list)		# Matches zero or more occurrences of the given patterns.
+(list)		# Matches one or more occurrences of the given patterns.
@(list)		# Matches one of the given patterns.
!(list) 	# Matches anything but the given patterns.

# Regular expressions (regex)
# similar to Glob Patterns, but they can only be used for pattern matching, not for filename matching.
# bash uses the Extended Regular Expression (ERE) dialect
# Regular Expression patterns that use capturing groups (parentheses) will have their captured strings assigned to the BASH_REMATCH variable for later retrieval
langRegex='(..)_(..)'
if [[ $LANG =~ $langRegex ]]
then
     echo "Your country code (ISO 3166-1-alpha-2) is ${BASH_REMATCH[2]}."
     echo "Your language code (ISO 639-1) is ${BASH_REMATCH[1]}."
else
     echo "Your locale was not recognised"
fi
# Since the way regex is used in 3.2 is also valid in 3.1 we highly recommend you just never quote your regex. Remember to keep special characters properly escaped!
# For cross-compatibility (to avoid having to escape parentheses, pipes and so on) use a variable to store your regex, e.g. re='^\*( >| *Applying |.*\.diff|.*\.patch)'; [[ $var =~ $re ]] This is much easier to maintain since you only write ERE syntax and avoid the need for shell-escaping, as well as being compatible with all 3.x BASH versions.

# Brace Expansion
# Brace Expansion technically does not fit in the category of patterns, but it is similar. Globs only expand to actual filenames, but brace expansions will expand to any possible permutation of their contents
# Brace expansion happens before filename expansion
echo th{e,a}n 	# then than
echo {1..9}			# 1 2 3 4 5 6 7 8 9
echo {0..1}{0..4} 	# 00 01 02 03 04 10 11 12 13 14

# for
for file in *.mp3
do rm "$file"
done

for i in 10 9 8 7 6 5 4 3 2 1
do echo "$i empty cups of juice."
done

for i in {10..1}
do echo "$i empty cups of juice."
done

# create array
names=(Bob Peter $USER Big "Bad Jonhn")
names=([0]=Bob [1]=Peter [20]=$USER [21]="Big Bad Jonhn")
names[0]=Bob
photos=(*.jpg)
echo ${name[1]}
echo ${name[*]}

(sleep 2 ; ls)
	process list
	() create a subshell 

coproc sleep 2
	spawns a subshell in background mode and executes a command within that subshell

coproc My_Job { sleep 10; }
	give a name to a job

$BASH_SUBSHELL
	number of subshell running

background mode
	allow the command to be processed and frees up your cli for other use

built-in vs external command
	echo - call the built-in command (when there is a built-in command)
	/bin/echo - call the external program

echo -n message
	no new line after echo

${var_1}e
	diferencie var_1 from var_1e

v1=`date`
v1=$(date)
	put output from command into variable
	command substitution characters

expr 1 + 5
expr 2 \* 2
	expr command used processing mathematical equations

var4=$[$var1 * ($var2 - $var3)]
	$[] - expression

zsh
	shell that suport full floating-point

bc -q 
	bash calculator
variable=$(echo "scale=4; 3.44 / 5 " | bc)

var5=$(bc << EOF
scale = 4
a1 = ( $var1 * $var2)
b1 = ($var3 * $var4)
a1 + b1
EOF
)
	the EOF text string indicates the beginning and end of the inline redirection data

if pwd
then
	echo "It worked"
else
	echo "Not worked"
fi

if pwd; then
	echo "It worked"
elif ls -d /etc; then
	echo "It worked"
else
	echo "not worked"
fi

if verify the exit code command

test $my_variable
	return 0 if hava some value

if [ 3 -gt 7 ]
test 3 -gt 7
numeric comparasions
  -eq, -ge, -gt, -le, -lt. -ne
string comparasions
 	=, !=, \<, \>, -n (length greater than zero), -z (length of zero)

-d
	file exists and is a directory

-e
	file exists

-f
	file exists and is a file

-r 
	file exists and is readable

-s 
	file exists and is not empry

-w
	file exists and is writable

-x
	file exists and is executable

-O
	file exists and is owned by the current user

-G
	file exists and the default group is the same as the current user

file1 -nt file2
	file1 is newer thean file2

file1 -ot file2
	file1 is older thean file2

if [[ @USER == r* ]]
	[[]] accept regular expression, [] not accept

case variable in
pattern1 | pattern2) commands1;;
pattern3) commands2;;
*) default commands;;
esac
	switch case

case $USER in
rich | barbara)
echo "Welcome, $USER"
echo "Please enjoy your visit";;
testing)
echo "Special testing account";;
jessica)
echo "Do not forget to log off when you're done";;
*)
echo "Sorry, you are not allowed here";;
esac

# IFS - internal field separator
#	the IFS environment variable defines a list of characters the bash shell uses as fi eld separators
#	default (space, tab, new line)
#	change IFS to new line only
IFS=$'\n'
#	newline, colon, semicolon, and double quotation mark 
# IFS=$'\n':;"

# best practice to change IFS
IFS.OLD=$IFS
IFS=$'\n'
# use the new IFS value in code
IFS=$IFS.OLD

# for-loop
for (( i=1; i <= 10; i++ ))
do
echo "The next number is $i"
done

# while-loop
var1=10
while [ $var1 -gt 0 ]
do
echo $var1
var1=$[ $var1 - 1 ]
done

# until-loop
# only the exit status of the last command determines if the bash shell executes the other commands defined
var1=100
until [ $var1 -eq 0 ]
do
echo $var1
var1=$[ $var1 - 25 ]
done

# Processing the output of a loop.
# Instead of displaying the results on the monitor, the shell redirects the results of the for command to the file output.txt.
for file in /home/rich/* ; do
	if [ -d "$file" ]; then
		echo "$file is a directory"
	elif
		echo "$file is a file"
	fi
done > output.txt

# piping a loop to another command
for state in "North Dakota" Connecticut Illinois Alabama Tennessee ; do
	echo "$state is the next place to go"
done | sort

# Process new user accounts
# To feed the data from the file into the while command, you just use a redirection symbol at the end of the while command
input="users.csv"
while IFS=',' read -r userid name
	do
	echo "adding $userid"
	useradd -c "$name" -m $userid
done < "$input"

# Shifts the command line parameters in their relative positions.
shift 
shift 2

# Take a list of command line options and parameters.
getopt ab:cd -a -b test1 -cde test2 test3
# -> -a -b test1 -c -d -- test2 test3
# ':', option need a parameter
# -q  omit error message

# Processing options and parameters
set -- $(getopt -q ab:cd "$@")
while [ -n "$1" ]
do
	case "$1" in
	  -a) echo "Found the -a option" ;;
	  -b) param="$2"
	      echo "Found the -b option, with parameter value $param"
	      shift ;;
	  -c) echo "Found the -c option" ;;
	  --) shift
	      break ;;
	  *) echo "$1 is not an option";;
	esac
	shift
done
#
count=1
for param in "$@"
do
	echo "Parameter #$count: $param"
	count=$[ $count + 1 ]
done

# getopts (plural), a bether getopt
# getopts optstring variable
# start optionstring with ':', to suppress error message
# OPTARG environment variable contains the value to be used if an option requires a parameter value
# OPTIND environment variable contains the value of the current location within the parameter list where getopts left off
while getopts :ab:c opt
do
	case "$opt" in
		a) echo "Found the -a option" ;;
		b) echo "Found the -b option, with value $OPTARG";;
		c) echo "Found the -c option" ;;
		*) echo "Unknown option: $opt";;
	esac
done

# Common Linux Command Line Options
# -a Shows all objects
# -c Produces a count
# -d Specifi es a directory
# -e Expands an object
# -f Specifi es a fi le to read data from
# -h Displays a help message for the command
# -i Ignores text case
# -l Produces a long format version of the output
# -n Uses a non-interactive (batch) mode
# -o Specifi es an output fi le to redirect all output to
# -q Runs in quiet mode
# -r Processes directories and fi les recursively
# -s Runs in silent mode
# -v Produces verbose output
# -x Excludes an object
# -y Answers yes to all questions