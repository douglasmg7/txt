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

printf "\nCloning dwm (Dynamic Windows Manager)..."
git clone https://aur.archlinux.org/dwm-git.git ~/aur/dwm-git
cd ~/aur/dwm-git
printf "\nCompiling dwm..."
makepkg -si
printf "\nCreating symbolic link to dwm configuration."
ln -s ~/dotfiles/dwm/config.h ~/aur/dwm-git/src/dwm/config.h
printf "\nRecompiling dwm with new configuration file..."
makepkg -fi

printf "\nCloning st (Simple terminal)..."
git clone https://aur.archlinux.org/st-git.git ~/aur/st-git
cd ~/aur/st-git
printf "\nCompiling st..."
makepkg -si
printf "\nCreating symbolic link to st configuration."
ln -s ~/dotfiles/st/config.h ~/aur/st-git/src/st/config.h
printf "\nRecompiling st with new configuration file..."
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
ln -s ~/dotfiles/xinitrc ~/.xinitrc

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

printf "\nInstalling libinput to set inputs like touchpad...\n"
sudo pacman -S xf86-input-libinput --noconfirm
# To config touchpad.
# $ xinput list
# $ xinput list-props device
# $ xinput set-prop <device> <option-number> <setting>

printf "\nCreating touchpad config file...\n" 
cat > /etc/X11/xorg.conf.d/30-touchpad.conf << EOF
# Touchpad tapping enable.
Section "InputClass"
  Identifier "ETPS/2 Elantech Touchpad"
	Driver "libinput"
	option "Tapping" "on"
EndSection
EOF

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
