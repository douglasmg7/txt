#!/usr/bin/env bash

echo "Set maximum space for log files..."
sudo journalctl --vacuum-size=100M

echo "Installing xclip..."
sudo pacman -S xclip 

echo "Installing screen saver..." 
sudo pacman -S cmatrix 

echo "Installing acpi for battery status..."
sudo pacman -S acpi --noconfirm

echo "Installing wget..."
sudo pacman -S wget --noconfirm

echo "Installing terminal multiplex..."
sudo pacman -S tmux --noconfirm

# echo "Installing process monitor..."
# sudo pacman -S htop --noconfirm

echo "Installing python 2..."
sudo pacman -S python2 python2-pip --noconfirm

echo "Installing python 3..."
sudo pacman -S python python-pip --noconfirm

echo "Installing vim..."
sudo pacman -S vim --noconfirm

echo "Installing neovim..."
sudo pacman -S neovim --noconfirm

echo "Installing mongodb and tools..."
sudo pacman -S mongodb mongodb-tools --noconfirm

echo "Installing redis..."
sudo pacman -S redis --noconfirm

# echo "Installing power analyzer..."
# sudo pacman -S powertop --noconfirm

# echo "Installing hd memory analyzer..."
# sudo pacman -S ncdu --noconfirm

echo "Installing ssh client..."
sudo pacman -S openssh --noconfirm

echo "Enabling ssh server..."
systemctl enable sshd
systemctl start sshd
