#!/usr/bin/env bash

# Identify the graphics card.
# lspci -v | grep -A1 -e VGA -e 3D

printf "\nInstalling video driver...\n"
sudo pacman -S  xf86-video-intel vulkan-intel mesa --noconfirm

printf "\nInstalling display server..."
sudo pacman -S xorg xorg-server --noconfirm

printf "\nInstalling Xstart..."
sudo pacman -S xorg-xinit --noconfirm 

# printf "\nCreating AUR directory..."
# mkdir -p ~/aur

# st.
# Required by dwm.
printf "\nCloning st (Simple terminal)..."
git clone https://git.suckless.org/st ~/src/st
cd ~/src/st
printf "\nCreating symbolic link to st configuration."
ln -s ~/dotfiles/st/config_asus.h ~/src/st/config.h
printf "\nClening, compiling and installing st..."
make clean
make
sudo make install

# dwm.
printf "\nCloning dwm (Dynamic Windows Manager)..."
git clone https://git.suckless.org/dwm ~/src/dwm
cd ~/src/dwm
printf "\nCreating symbolic link to dwm configuration."
ln -s ~/dotfiles/dwm/config_asus.h ~/src/dwm/config.h
printf "\nClening, compiling and installing dwm..."
make clean
make
sudo make install

printf "\nCreating Xserver config file...\n" 
cat > ~/.xserverrc << EOF
#!/bin/sh
exec /usr/bin/Xorg -nolisten tcp "\$@" vt\$XDG_VTNR
EOF

printf "\nCreating symbolic link for .xinitrc...\n"
ln -s ~/dotfiles/xinitrc_asus ~/.xinitrc

# .Xresources
printf "\nCreating symbolic link for .Xresources...\n"
ln -s ~/dotfiles/Xresources ~/.Xresources

printf "\nInstalling xserver fonts..."
sudo pacman -S ttf-dejavu ttf-inconsolata --noconfirm

printf "\nInstalling dmenu..."
sudo pacman -S dmenu --noconfirm

# To show current wifi on dwm menu.
printf "\nInstalling iw...\n"
sudo pacman -S iw --noconfirm

printf "\nInstalling slock..."
sudo pacman -S slock --noconfirm

# Required by xorg-server.
printf "\nInstalling libinput to set inputs like touchpad...\n"
sudo pacman -S xf86-input-libinput --noconfirm
# To config touchpad.
# $ xinput list
# $ xinput list-props device
# $ xinput set-prop <device> <option-number> <setting>

# Keyboard layout setting (no needed, alredy on .xinitrc).
# $ startx
# List current config.
# $ setxkbmap -query
# Set keyboard layout.
# $ setxkbmap -model abnt2 -layout br -option
# Blank option, so compose:ralt will not be setted.

# Start xserver using ~/.xinitrc.
# startx    

# Start xserver using a dwm windows manager, not using ~/.xinirc.
# startx /usr/bin/dwm   

# Quit xserver.
# pkill -15 Xorg
