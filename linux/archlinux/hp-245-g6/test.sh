#!/usr/bin/env bash


printf "Creating Xserver config file..." 
cat > ~/.xserverrc << EOF
#!/bin/sh
exec /usr/bin/Xorg -nolisten tcp "$@" vt$XDG_VTNR
EOF

printf "Creating symbolic link for .xinitrc..."
ln -s ~/dotfiles/xinitrc ~/.xinitrc

# .Xresources
printf "Creating symbolic link for .Xresources..."
ln -s ~/dotfiles/Xresources ~/.Xresources
