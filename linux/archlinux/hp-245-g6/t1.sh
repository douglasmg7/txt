#!/usr/bin/env bash

printf "\nCreating symbolic link to dwm configuration...\n"
rm ~/aur/dwm-git/src/dwm/config.h
ln -s ~/dotfiles/dwm/config.h ~/aur/dwm-git/src/dwm/config.h
printf "\nRecompiling dwm with new configuration file...\n"
cd ~/aur/dwm-git
makepkg -fi

