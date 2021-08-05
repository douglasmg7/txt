scrot - enables taking screenshots (printscreen) from the CLI.
=====

### Square selection or windows selection.
scrot -s

### Time delay and file name (with countdown).
scrot -d 5 screen.png
scrot -d 5 -c screen.png

### Limit the screenshot to the currently focused window (-b include the border).
scort -u
scort -ub

### Image quality.
scrot -quality 10

### Image size.
scrot --thumb

### Merge.
scrot -m

### Open into another program.
scrot abc.png -e 'gthumb abc.png'