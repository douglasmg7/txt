color=blue
define var color

echo $color
echo ${color}
print var color

export color
make color global

export PATH
tells the shell to make the contents of PATH available to child process
of this shell

unset color
unmake color global

echo "A data é `date`"
`` execute the comand between back quote

read tmp
write user input do variable tmp

printf "Oi\nBeleza\n"
to use escape sequence

ctrl-d
end of file

alias l='ls -l'
create a alias name

[<test>] && <command>
if <test> true, the command <command> is executed

[<test>] || <command>
if <test> true, the command <command> is not executed

echo $-
show flags that determine how your shell will function

source ~/.bash_profile
reload profile file

export PS1=">> "
PS1 is a variable that defines the makeup and style of the command prompt

env
list of the environment variable of current user

