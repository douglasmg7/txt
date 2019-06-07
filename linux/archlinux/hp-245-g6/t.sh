#!/usr/bin/env bash

printf "\nCreating symbolic link to ssh configuration file..."
mkdir -p ~/.ssh
ln -s ~/dotfiles/ssh/config ~/.ssh/config
cp ~/dotfiles/ssh/ssh-agent.service ~/.ssh/ssh-agent.service
systemctl --user enable ssh-agent.service

printf "\nCreating symbolic link to git configuration file..."
ln -s ~/dotfiles/gitconfig ~/.gitconfig

printf "\nInstalling moc player..."
sudo pacman -S moc --noconfirm
printf "\nCreating symbolic link to mocp configuration file..."
mkdir -p ~/.moc
ln -s ~/dotfiles/moc/config ~/.moc/config
