echo $?
obtem o valor retornado pelo programa que acabou de finalizar

::
scope operator

<<
output operator

>>
input operator

ctrl+z
end of file - windows

ctrl+d
end of file - linux and mac

prg.exe < in_file.txt > out_file.txt
define in file and out file

standard io
<iostream>
cin, cout, cerr, clog

std::endl
manipulator - ending the current line and flushing the buffer associated with that device

using std::cout;
we are using the object cout from the std namespace

using namespace std;
we are using everything in the std namespace

g++ -o main -I /source/includes main.cpp
specify an alternate include directory

 
int nValue = 5;
explicit initialization

int nValue(5);
implicit initialization
favor implicit initialization over explicit initialization

int value{5}
uniform initialization / list initialization
if you’re using a C++11 compatible compiler, favor uniform initialization

uninitialized built-in type
0 - if global
undefinded - if inside function

extern int i; // declares but not define i
int j // declare and defines j

extern double pi = 3.1416 // definition
it is an error to provide an initializer on an extern inside a function
overrides the extern

variables must be defined exactly once but can be declared many times

c++ is a statically typed language
which means that types are checked at compile time

ths standard reserves a set of names for use in the standard library
the indentifiers we define in ou own programs may not contain
	two consecutive undescores
	begin with an undescores followed immediately by uppercase letter
	identifiers defined outside a function may not begin with an undescore


