#!/usr/bin/env bash

printf "\nCreating symbolic link to dwm configuration...\n"
rm ~/aur/dwm-git/src/dwm/config.h
ln -s ~/dotfiles/dwm/config.h ~/aur/dwm-git/src/dwm/config.h
printf "\nRecompiling dwm with new configuration file...\n"
cd ~/aur/dwm-git
makepkg -fi

printf "\nCreating symbolic link to st configuration...\n"
rm ~/aur/st-git/src/st/config.h
ln -s ~/dotfiles/st/config.h ~/aur/st-git/src/st/config.h
printf "\nRecompiling st with new configuration file...\n"
cd ~/aur/st-git
makepkg -fi
