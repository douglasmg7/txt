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

# Termite - terminal emulator
# pacman -S termite

# Xserver config file.
~/.xserverrc
  #!/bin/sh
  exec /usr/bin/Xorg -nolisten tcp "$@" vt$XDG_VTNR

# .xinitrc conig file.
$ ln -s ~/dotfiles/xinitrc ~/.xinitrc
# Or
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc

# .Xresources
$ ln -s ~/dotfiles/Xresources ~/.Xresources

# Start xserver using ~/.xinitrc.
$ startx    

# Start xserver using a dwm windows manager, not using ~/.xinirc.
$ startx /usr/bin/dwm   

# Quit xserver.
$ pkill -15 Xorg

# install atom
$ pacman -S atom
# Create symbolic link for files in ~/dotfiles/atom in ~/.atom.
# Install atom packages.
$ apm install --packages-file ~/.atom/package.list    

# Install browsers.
$ pacman -S firefox
$ pacman -S flashplugin
# If flash sound not work.
$ pacman -S libvdpau-va-gl
$ pacman -S chromium

# Install xserver fonts.
$ pacman -S ttf-dejavu ttf-inconsolata

# Install file manager.
$ pacman -S pcmanfm

# Pdf readers.
$ pacman -S evince
$ pacman -S mupdf
$ pacman -S apvlv

# Image viewer
$ pacman -S feh

# alsamixer and mixer.
$ pacman -S alsa-utils

# Sound server.
$ pacman -S pulseaudio pulseaudio-alsa

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
