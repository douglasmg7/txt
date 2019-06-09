#!/usr/bin/env bash

printf "\nCreating symbolic link to dwm configuration...\n"
ln -s ~/dotfiles/dwm/config.h ~/aur/dwm-git/src/dwm/config.h
printf "\nRecompiling dwm with new configuration file...\n"
makepkg -fi

printf "\nCreating symbolic link to st configuration...\n"
ln -s ~/dotfiles/st/config.h ~/aur/st-git/src/st/config.h
printf "\nRecompiling st with new configuration file...\n"
makepkg -fi
