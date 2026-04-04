gawk - is the GNU version of the original awk program in Unix
options
	-F fs Specifies a file separator for delineating data fi elds in a line
	-f file Specifi es a file name to read the program from
	-v var=value Defines a variable and default value used in the gawk program
	-mf N Specifies the maximum number of fields to process in the data file
	-mr N Specifies the maximum record size in the data file
	-W keyword Specifies the compatibility mode or warning level for gawk

gawk data field variables
	$0 represents the entire line of text.
	$1 represents the first data field in the line of text.
	$2 represents the second data field in the line of text.
	# $n represents the nth data field in the line of text.

gawk '{print $1}' data.txt
	print the first line

echo "My name is Rich" | gawk '{$4="Christine"; print $0}'
	multiple commands
