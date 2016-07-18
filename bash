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

# hashbang - shebang
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

# control operator
cmd_a; cmd_b	# start a new line, run the command and wait for it to end before advancing to the next command in the list 
cmd_a || cmd_b	# run the command before it as it normally would, but after finishing that command move to the next command only if the command before it failed

# bash commands
	# functions - are previously declared blocks of commands that were given a name
	# builtin - are tiny procedures built into bash
	# program - also called an external command (ls, sort, etc...)

# show where bash find the program
type ping
type echo

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
>		# output
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
# Expands a single string, joining all positional parameters into one, separated by the first character in IFS (by default, a space).
# Note: You should never use this parameter unless you explicitly intend to join all the parameters. You almost always want to use @ instead.

"$@"	
rm "$@"	
# Expands the positional parameters as a list of separate arguments.
bash -c 'echo "${@: -1}"' -- 1 2 'The Third'
# The Third

"$#"	
echo "Count: $#"	
# Expands into a number indicating the amount of positional parameters that are available.

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
