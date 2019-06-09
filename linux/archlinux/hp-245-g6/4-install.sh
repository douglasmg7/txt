#!/usr/bin/env bash

printf "\nInstalling video driver...\n"
sudo pacman -S xf86-video-intel --noconfirm

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

printf "\nInstalling pulse audio interface (cli)..."
sudo pacman -S pamixer --noconfirm

printf "\nInstalling pulse audio interface (gui)..."
sudo pacman -S pavucontrol --noconfirm

printf "\nInstalling mpg124..."
sudo pacman -S mpg123 --noconfirm

printf "\nInstalling mplayer..."
sudo pacman -S mplayer --noconfirm

# printf "\nInstalling libs to play encrypted DVDs..."
# sudo pacman -S libdvdread libdvdcss libdvdnav --noconfirm

# printf "\nInstalling cdparanoia (cd ripper)..."
# sudo pacman -S cdparanoia --noconfirm

printf "\nInstalling unrar..."
sudo pacman -S unrar --noconfirm

printf "\nInstalling unzip..."
sudo pacman -S unzip --noconfirm

printf "\nInstalling mkfs.vfat..."
sudo pacman -S dosfstools --noconfirm

printf "Cloning simple-mtpfs, mtp (media transfer protocol) to connect to Android phone..."
git clone https://aur.archlinux.org/simple-mtpfs.git ~/aur/simple-mtpfs.git
cd ~/aur/simple-mtpfs
printf "\nInstalling simple-mtpfs..."
makepkg -si

# reboot now