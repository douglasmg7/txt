#!/usr/bin/env bash

printf "\nInstalling display server..."
sudo pacman -S xorg xorg-server --noconfirm

printf "\nInstalling Xstart..."
sudo pacman -S xorg-init --noconfirm 

printf "\nCreating AUR directory..."
mkdir -p ~/aur

cd ~/aur
printf "\nCloning dwm (Dynamic Windows Manager)..."
git clone https://aur.archlinux.org/dwm-git.git
cd ~/aur/dwm-git
printf "\nCompiling dwm..."
makepkg -si
printf "\nCreating symbolic link to dwm configuration."
ln -s ~/dotfiles/dwm/config.h ~/aur/dwm-git/src/dwm/config.h
printf "\nRecompiling dwm with new configuration file..."
makepkg -fi

cd ~/aur
printf "\nCloning st (Simple terminal)..."
git clone https://aur.archlinux.org/st-git.git
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

printf "Creating Xserver config file..." 
car > ~/.xserverrc << EOF
#!/bin/sh
exec /usr/bin/Xorg -nolisten tcp "$@" vt$XDG_VTNR
EOF

printf "Creating symbolic link for .xinitrc..."
$ ln -s ~/dotfiles/xinitrc ~/.xinitrc

# .Xresources
printf "Creating symbolic link for .Xresources..."
$ ln -s ~/dotfiles/Xresources ~/.Xresources

printf "\nInstalling xserver fonts..."
sudo pacman -S ttf-dejavu ttf-inconsolata --noconfirm

# Start xserver using ~/.xinitrc.
# startx    

# Start xserver using a dwm windows manager, not using ~/.xinirc.
# startx /usr/bin/dwm   

# Quit xserver.
# pkill -15 Xorg

# install atom
# pacman -S atom
# Create symbolic link for files in ~/dotfiles/atom in ~/.atom.
# Install atom packages.
# apm install --packages-file ~/.atom/package.list    

# Install browsers.
printf "\nInstalling Firefox..."
sudo pacman -S firefox flashplugin --noconfirm
# If flash sound not work.
# pacman -S libvdpau-va-gl
# pacman -S chromium


# File manager.
printf "\nInstalling file manager..."
sudo pacman -S pcmanfm --noconfirm

# Pdf readers.
printf "\nInstalling pdf readers..."
sudo pacman -S evince mupdf apvlv --noconfirm

# Image viewer
printf "\nInstalling image viewer..."
sudo pacman -S feh --noconfirm

# alsamixer and mixer.
printf "\nInstalling alsamixer and mixer..."
sudo pacman -S alsa-utils --noconfirm

# Sound server.
printf "\nInstalling sound server..."
sudo pacman -S pulseaudio pulseaudio-alsa --noconfirm

# Pulse audio interface (gui).
$ pacman -S pavucontrol

# Pulse audio interface (cli).
$ pacman -S pamixer

# mpg123
$ pacman -S mpg123

# Mplayer
$ pacman -S mplayer

# To play encrypted DVDs, you must install the libdvd* packages.
$ pacman -S libdvdread libdvdcss libdvdnav

# Cdparanoia (cd ripper)
$ pacman -S cdparanoia

# unrar.
$ pacman -S unrar

# unzip.
$ pacman -S unzip

# mkfs.vfat.
$ pacman -S dosfstools

# mtp (media transfer protocol) to connect to Android phone.
$ mkdir -p ~/aur && cd ~/aur && git clone https://aur.archlinux.org/simple-mtpfs.git
$ makepkg -si
$ reboot now


todo
verify who is setting xterm-256color
/etc/default/grub
  GRUB_TIMEOUT=0
# Change the file to make grub not wait.

grub-mkconfig -o /bood/grub/grub.cfg
# Remember that grub.cfg has to be re-generated after any change to /etc/default/grub or files in /etc/grub.d/.
