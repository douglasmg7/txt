#!/usr/bin/env bash

printf "\nSet maximum space for log files...\n"
sudo journalctl --vacuum-size=100M

printf "\nSarting/enabling datetime sync...\n"
sudo systemctl start systemd-timesyncd.service
sudo systemctl enable systemd-timesyncd.service

printf "\nInstalling git...\n"
sudo pacman -S git --noconfirm

printf "\nCloning txt...\n"
git clone https://github.com/douglasmg7/txt.git ~/txt

printf "\nCloning dotfiles...\n"
git clone https://github.com/douglasmg7/dotfiles.git ~/dotfiles

printf "\nCreating symbolic link to git configuration file...\n"
ln -s ~/dotfiles/gitconfig ~/.gitconfig
# Git configuration.
# git config --global user.name "douglasmg7"
# git config --global user.email "douglasmg7@gmail.com"
# git config --global core.editor vi
# Set the cache to timeout after 10 hours (setting is in seconds).
# git config --global credential.helper 'cache --timeout=36000'

# Installing aic94xx-firmware.
mkdir -p ~/aur && cd ~/aur
printf "Cloning aic94xx-firmware..."
git clone https://aur.archlinux.org/aic94xx-firmware.git
cd ~/aur/aic94xx-firmware
printf "\nInstalling aic94xx-firmware..."
makepkg -si

# Installing aic94xx-firmware.
cd ~/aur
printf "Cloning wd719x-firmware..."
git clone https://aur.archlinux.org/wd719x-firmware.git
cd ~/aur/wd719x-firmware
printf "\nInstalling wd719x-firmware..."
makepkg -si

printf "\nInstalling xclip..."
sudo pacman -S xclip --noconfirm

printf "/nInstalling screen saver..."
sudo pacman -S cmatrix --noconfirm

printf "/nInstalling acpi for battery status..."
sudo pacman -S acpi --noconfirm

printf "\nInstalling wget..."
sudo pacman -S wget --noconfirm

printf "\nInstalling moc player..."
sudo pacman -S moc --noconfirm

printf "\nCreating symbolic link to mocp configuration file..."
mkdir -p ~/.moc
ln -s ~/dotfiles/moc/config ~/.moc/config

# printf "\nInstalling youtube download..."
# sudo pacman -S youtube-dl --noconfirm

printf "\nInstalling terminal multiplex..."
sudo pacman -S tmux --noconfirm

printf "\nSet tmux configuration symbolic link..."
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# printf "\nInstalling process monitor..."
# sudo pacman -S htop --noconfirm

printf "\nInstalling python 2..."
sudo pacman -S python2 python2-pip --noconfirm

printf "\nInstalling python 3..."
sudo pacman -S python python-pip --noconfirm

printf "\nInstalling redis..."
sudo pacman -S redis --noconfirm
# Default port - 6379
# sudo systemctl enable redis
# sudo systemctl start redis

# printf "\nInstalling power analyzer..."
# sudo pacman -S powertop --noconfirm

# printf "\nInstalling hd memory analyzer..."
# sudo pacman -S ncdu --noconfirm

printf "\nInstalling ssh client..."
sudo pacman -S openssh --noconfirm

printf "\nEnabling ssh server..."
sudo systemctl enable sshd
sudo systemctl start sshd

printf "\nCreating symbolic link to ssh configuration file..."
mkdir -p ~/.ssh
ln -s ~/dotfiles/ssh/config ~/.ssh/config
cp ~/dotfiles/ssh/ssh-agent.service ~/.ssh/ssh-agent.service
# todo - not working.
systemctl --user enable ssh-agent.service

printf "\nInstalling bluetoooth...\n..."
sudo pacman -S bluez bluez-utils pulseaudio-bluetooth --noconfirm
printf "\nStarting/Enabling bluetooth service...\n"
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

printf "\nInstalling vim..."
# sudo pacman -S vim --noconfirm
printf "\n\nSetting vim configuration..."
mkdir -p ~/.vim && mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +q +q

printf "\nInstalling neovim..."
# sudo pacman -S neovim --noconfirm
printf "\n\nSetting neovim configuration..."
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
sudo pacman -S python-neovim --noconfirm

# Make capslock a leftctrl.
# cd /etc/udev/hwdb.d
# ln -s ~/dotfiles/70-keyboard-my.hwdb 70-keyboard-my.hwdb
# systemd-hwdb update
# udevadm trigger

# Use AUR.
# pacman -S mongodb mongodb-tools
# Enable mongodb.
# systemctl enable mongodb
# systemctl start mongodb

# Node.
# curl -L https://git.io/n-install | bash
