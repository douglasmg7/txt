# Bourne Again Shell - bash

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

# run a bash script
chmod + script.txt
bash script.txt
./script.txt

# which shell
echo $SHELL

# /bin/usr/env
# It's a program that can find and start other programs

# hashbang - shebang
# it is important to use, for compatibility
#!/usr/bin/env bash
#!/bin/env bash

# how long take to run the command
time ls

# shell configuration
~/.bash_profile 	# if not exist look for ~/.profile
~/.profile 	# generic shell profile configuration file (POSIX sh syntax not bash-specific shell syntax)
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
	# shell variables - parameter that has a name

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
