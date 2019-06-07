#!/usr/bin/env bash

printf "\nCloning dotfiles..."
git clone https://github.com/douglasmg7/dotfiles.git ~/dotfiles

printf "\nSet tmux configuration symbolic link..."
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

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
