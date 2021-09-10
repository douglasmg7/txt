#!/usr/bin/env bash

# Identify the graphics card.
# lspci -v | grep -A1 -e VGA -e 3D

printf "\nInstalling video driver...\n"
sudo pacman -S nvidia --noconfirm

printf "\nInstalling openGL driver...\n"
sudo pacman -S nvidia-utils --noconfirm
# If you run into trouble with CUDA not being available, run nvidia-modprobe first.

printf "\nInstalling display server..."
sudo pacman -S xorg xorg-server --noconfirm

printf "\nInstalling Xstart..."
sudo pacman -S xorg-xinit --noconfirm 

printf "\nCreating AUR directory..."
mkdir -p ~/aur

# st.
# Required by dwm.
printf "\nCloning st (Simple terminal)..."
git clone https://aur.archlinux.org/st.git ~/aur/st
cd ~/aur/st
printf "\nCompiling st..."
makepkg -s
printf "\nCreating symbolic link to st configuration."
mv ~/aur/st/src/st-0.8.4/config.h ~/aur/st/src/st-0.8.4/config_old.h
ln -s ~/dotfiles/st/config_amd_ryzen_7_3700.h ~/aur/st/src/st-0.8.4/config.h
printf "\nRecompiling st with new configuration file..."
makepkg -fi

# dwm.
printf "\nCloning dwm (Dynamic Windows Manager)..."
git clone https://aur.archlinux.org/dwm.git ~/aur/dwm
cd ~/aur/dwm
# Edit PKGBUILD, comment the line:
#   cp "$srcdir/config.h" config.h
# Maybe
#   rm ~/aur/dwm/src/config.h
#   Edit PKGBUILD, add line:
#       cp "$srcdir/$pkgname-$pkgver/config.h" "$srcdir/config.h"
printf "\nCompiling dwm..."
makepkg -s
printf "\nCreating symbolic link to dwm configuration."
mv ~/aur/dwm/src/dwm-6-2/config.h ~/aur/dwm/src/dwm-6-2/config_old.h
ln -s ~/dotfiles/dwm/config_amd_ryzen_7_3700.h ~/aur/dwm/src/dwm-6-2/config.h
printf "\nRecompiling dwm with new configuration file..."
makepkg -fi

# printf("\nInstalling Terminal emulator for the X Window System..."
# sudo pacman -S xterm --noconfirm

# printf("\nInstalling Unicode rxvt - terminal emulator..."
# sudo pacman -S urxvt --noconfirm

# printf("\nInstalling Termite - terminal emulator..."
# sudo pacman -S termite --noconfirm

printf "\nCreating Xserver config file...\n" 
cat > ~/.xserverrc << EOF
#!/bin/sh
exec /usr/bin/Xorg -nolisten tcp "\$@" vt\$XDG_VTNR
EOF

printf "\nCreating symbolic link for .xinitrc...\n"
ln -s ~/dotfiles/xinitrc_amd_ryzen_7_3700 ~/.xinitrc

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
