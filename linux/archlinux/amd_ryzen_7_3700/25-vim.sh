#!/usr/bin/env bash

printf "\nInsalling cmake...\n"   # Needed by YouCompleteMe vim plugin.
sudo pacman -S cmake --noconfirm

printf "\nInstalling vim...\n"
sudo pacman -S vim --noconfirm
printf "\nSetting vim configuration...\n"
mkdir -p ~/.vim && mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +q +q
vim +GoInstallBinaries +q   # Needed by vim-go plugin.
# Compile YouCompleteMe components.
printf "\nCompiling YCM components...\n"
cd ~/.vim/bundle/youcompleteme
python3 install.py --go-completer --ts-completer

printf "\nInstalling neovim...\n"
sudo pacman -S neovim --noconfirm
printf "\nSetting neovim configuration...\n"
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
sudo pacman -S python-neovim --noconfirm
