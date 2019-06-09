#!/usr/bin/env bash


printf "\nCreating Xserver config file...\n" 
cat > ~/.xserverrc << EOF
#!/bin/sh
exec /usr/bin/Xorg -nolisten tcp "\$@" vt\$XDG_VTNR
EOF

printf "\nCreating symbolic link for .xinitrc...\n"
ln -s ~/dotfiles/xinitrc ~/.xinitrc

# .Xresources
printf "\nCreating symbolic link for .Xresources...\n"
ln -s ~/dotfiles/Xresources ~/.Xresources
