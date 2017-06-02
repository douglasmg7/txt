#include <sdtio.h> - inclui uma biblioteca padrão

#define PI 3.14159 - define uma constante

sizeof()
memória utilizada em bytes por uma variável

strlen()
comprimento da string sem \0 - #include <string.h>

data object
region of data storage that can be used to hold data

lvalue
expression that identifies a particular data object

rvalue
quantities that can be assigned to modifiable lvalues

operand
what operators operate on

operator
realiza alguma coisa

expression
consist of combination of operators and operands

statment
a complete instruction to the computer - indicated by a semicolon at the end

ctype.h
funções para trabalhar com caracter - pg 229

echo $?
obtem o retorno do programa

gcc -H -fsyntax-only address.c
list head files in a c file
continuar pg 240

ENOENT
It's an abbreviation of Error NO ENTry, and can actually be used for more than files/directories.

num[3] == *(num + 3) == *(3 + num) == 3[num]
# Array
 
char *cards = "JQK";
# This create a string literal into constant area of memory and make cards point to there.
# cards can not be used to change the string literal.
# Use array instead.
const chat *cards = "JQK";
# Is the same as above. Use this.

char cards[] = "JQK";
# This create a string literal into constant area of memory and make a copy to the array.

make(int num[]){
}
make(int *num({
}
# These two functions are equivalent.
# Array as parameter is treated as array.
