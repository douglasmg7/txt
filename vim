:e   open file
ZZ, :wq, :x   salva e sai (:x only save if necessary)
:q!   quit without save
:e!   descarta as alterações
:qa   close all

M - put cursor on middle of the text

3gg - vai para linha 3
3G  - vai para linha 3

:set wm=10
configura o tamanho do warp

:set tabstop=4
configura o tamanho do tab

:set nu
mostra o número da linha

<C-h>   delete a letter in insert mode
<C-w>   delete a word in insert mode
<C-u>   delte back to start of line
<C-m>   cr
<C-j>   line feed
<C-i>   horizontal tab

l - um caracter
aw - uma palavra
ap - um parágrafo
dd - repeat the operator to applay to a line

d    delete
dl   um caracter
daw   uma palavra
dap   um parágrafo
d0   até o inicio da linha
d^   delete from current backward to first non-white-space character
dw   até o final da palavra
dd   toda a linha
d$ ou D   cut até o final da linha

c - change (go to insert mode)

y - yank into register

P - cola antes do cursor
p - cola depois do cursor
"0p - cola the yank before the last d

r   modifica um único caracter e volta pro modo comando
R   modifica o texto até presionar esc
s   apaga um caracter e vai para o modo insert
x   apaga um caracter e continua no modo comand
X   del character before
S   apaga a linha e vai pro modo insert
J   make rows a line

gu - low case
gU - upper case
g~ - toggle case (use espace after ~)

guaw - low case a word
gUgU - upper case all the line
gUU - upper case all the line
gUap - uper case a paragraph
~~ - modifica o case do caracter
gUit - upper case inside tag


:syntax on
colore o texto em função da sintaxe


u   undo
ctrl-r   redo
U   return the last line which was modified to its original state (reverse all changes in last modified line) 

. - repete a ultima entrada

:help vimrc - visualiza arquivo de ajuda
:version - obtem a versão do vim
:echo $HOME - diretório utilizado pelo vim
:echo expand('~')
:echo $VIM
:echo $VIMRUNTIME

:reg
access all currently defined registers

"ay - copy o texto selecionado para o registro a
"ap - paste o texto do registro a
"+y - copy to clipboard
"+x - cut from clipboard
"+p - paste from clipboard
"* - system clipboard
"+ - system clipboard
": - last comand

:so %
:so $MYVIMRC
reload .vimrc
so=source read the content of especified file and tread this as vim code
% stands for current file name

/ - find
n - next find
N - back find
ggn - start file
Gn - end file
? - find backward
* - find forward for the word under the cursor
# - find backword for the word under the cursor

:ls - list all buffers
:bn - go to next buffer
:bd - delete atual buffer
:b1 - go to buffer 1
:2bd - delete o buffer 2
:bd txt <tab> - show buffers that match the txt
<C-6> - trogglo between two buffers

:r file - insert the file below the cursor
:r !cmd - execute cmd and insert its standard output below the cursor

slpit windows
Ctrl + w, S for horizontal splitting
Ctrl + w, V for vertical splitting
Ctrl + w, Q to close one
Ctrl + w, Ctrl+W to switch between windows
Ctrl + w, J (xor K, H, L) to switch to adjacent window (intuitively up, down, left, right)
:sp filename for a horizontal split
:vsp filename or :vs filename for a vertical split

:h key-notation
key notation information

vim -u NONE -N
-u NONE - not to source your vimrc on startup
-N - nocompatible mode (keep useful features enable)

.
repeat the last command (entry insert to leave isert)

>>
ident a line

5>>
ident five lines

vjj>
ident several lines

>%
ident all the curl, must be in the line of curl

f+
to the next + symbol in the line

F+
to the previous + symbol in the line

;
repeat the last search that the f command performed

,
repeat the last search that the f command performed backward

:s/the/The
substitution the by The in the current line

:%s/the/The/g
substitution the by The in all file

&
repeat the last substitution

*
search for the word under the cursor

<C-a>
plus one on numbers under cursor or after the cursor (same line)

100<C-a>
add 100 to the first number after the cursor

<C-x>
minus one on numbers under cursor or after the cursor (same line)

operator+movement
dw
after type d, vim go to operator-pending mode


<C-o>
insert normal mode

<C-[>
esc

zz
scrool the position of cursor to the middle of window

<C-r>0
paste the text that we just yanked - character by character

<C-r><C-p>{register}
paste without indentation - a junk of character

<C-r>=
input a aritmetic count in insert mode

<C-v>065
insert a characte in insert mode

<C-v>u00bf
insert a character in hexadecimal

ga
find a numeric code for a character in the cursor

<C-k>{char}{char}
insert a character represented by digraph

:h digraphs-default
:h digraphs-table
:digraphs
summarized digraphs

R
replace mode

gR
virtual replace mode - treats the tab character as though it consisted of spaces

gr
single-shot virual replace mode

COLORSCROLL
view themes

:help usr_41.txt
help function-list
earn vim script

paste from clipboard
ctrl + shift + v

ctrl + f
move forward one screenfull

ctrl + bb
move backward one screenfull

{
move to start of pargagraph or code block

}
move to end of paragraph or code block

gi
go to the last edit point in insert mode

g,
go to the last edit point

f<char>
move to next <char> (line command)

F<char>
move to previous <char> (line command)

q:
command history

q/
search history

vi -o file1 file2 file3
split horizontal

vi -O file1 file2 file3
split vertical

vi -p file1 file2 file3
tabs

:tabedit {file}   edit specified file in a new tab
:tabfind {file}   open a new tab with filename given, searching the 'path' to find it
:tabclose         close current tab
:tabclose {i}     close i-th tab
:tabonly          close all other tabs (show only the current tab)

:tabs         list all tabs including their displayed windows
:tabm 0       move current tab to first
:tabm         move current tab to last
:tabm {i}     move current tab to position i+1

:tabn         go to next tab
:tabp         go to previous tab
:tabfirst     go to first tab
:tablast      go to last tab

:noh    turn off highlighting until the next search
