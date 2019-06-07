#!/usr/bin/env bash

# Git configuration.
git config --global user.name "Douglas Gomes"
git config --global user.email "douglasmg7@gmail.com"
git config --global core.editor vi

echo "Set maximum space for log files..."
sudo journalctl --vacuum-size=100M

echo "Installing xclip..."
sudo pacman -S xclip --noconfirm

echo "Installing screen saver..."
sudo pacman -S cmatrix --noconfirm

echo "Installing acpi for battery status..."
sudo pacman -S acpi --noconfirm

echo "Installing wget..."
sudo pacman -S wget --noconfirm

# echo "Installing youtube download..."
# sudo pacman -S youtube-dl --noconfirm

echo "Installing terminal multiplex..."
sudo pacman -S tmux --noconfirm

# echo "Installing process monitor..."
# sudo pacman -S htop --noconfirm

echo "Installing python 2..."
sudo pacman -S python2 python2-pip --noconfirm

echo "Installing python 3..."
sudo pacman -S python python-pip --noconfirm

echo "Installing redis..."
sudo pacman -S redis --noconfirm
# Default port - 6379
# sudo systemctl enable redis
# sudo systemctl start redis

# echo "Installing power analyzer..."
# sudo pacman -S powertop --noconfirm

# echo "Installing hd memory analyzer..."
# sudo pacman -S ncdu --noconfirm

echo "Installing ssh client..."
sudo pacman -S openssh --noconfirm

echo "Enabling ssh server..."
sudo systemctl enable sshd
sudo systemctl start sshd
