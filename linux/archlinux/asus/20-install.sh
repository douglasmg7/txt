#!/usr/bin/env bash

printf "\nSet maximum space for log files...\n"
sudo journalctl --vacuum-size=100M

printf "\nSarting/enabling datetime sync...\n"
sudo systemctl start systemd-timesyncd.service
sudo systemctl enable systemd-timesyncd.service

printf "\nCreating symbolic link to git configuration file...\n"
ln -s ~/dotfiles/gitconfig ~/.gitconfig

printf "\nInstalling python 3..."
sudo pacman -S python python-pip --noconfirm

printf "\nInstalling xclip..."
sudo pacman -S xclip --noconfirm

printf "/nInstalling acpi for battery status..."
sudo pacman -S acpi --noconfirm

printf "\nInstalling wget..."
sudo pacman -S wget --noconfirm

printf "\nInstalling curl..."
sudo pacman -S curl --noconfirm

printf "\nInstalling moc player..."
sudo pacman -S moc --noconfirm

# printf "\nCreating symbolic link to mocp configuration file..."
# mkdir -p ~/.moc
# ln -s ~/dotfiles/moc/config ~/.moc/config

printf "\nInstalling jq..."
sudo pacman -S jq --noconfirm

# printf "\nInstalling youtube download..."
# sudo pacman -S youtube-dl --noconfirm
#
printf "\nInstalling terminal multiplex..."
sudo pacman -S tmux --noconfirm

printf "\nSet tmux configuration symbolic link..."
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

printf "\nInstalling process monitor htop and btop..."
sudo pacman -S htop btop --noconfirm

printf "\nInstalling ripgrep - used by lazy neovim..."
sudo pacman -S ripgrep

printf "\nInstalling ast-grep - used by lazy neovim..."
sudo pacman -S ast-grep

# Command-line fuzzy finder
printf "\nfzf..."
sudo pacman -S fzf --noconfirm

# Command line tool for search inside files
printf "\nrg..."
sudo pacman -S rg --noconfirm

# Command line tool for search files
printf "\nfd..."
sudo pacman -S fd --noconfirm

# Command line tool for show simplified help
printf "\ntldr..."
sudo pacman -S tldr --noconfirm

# Überzug++ is a command line utility written in C++ which allows to draw images on terminals by using X11/wayland 
printf "\nueberzugpp..."
sudo pacman -S ueberzugpp --noconfirm

# resvg is an SVG rendering library
printf "\nresvg..."
sudo pacman -S resvg --noconfirm

# zoxide is a smarter cd command, inspired by z and autojump
printf "\nzoxide..."
sudo pacman -S zoxide --noconfirm

# Chafa is a command-line utility that converts image data, including animated GIFs, into graphics formats or ANSI.
printf "\nchafa..."
sudo pacman -S chafa --noconfirm

# ImageMagick® is a free, open-source software suite, used for editing and manipulating digital images
printf "\nimagemagick..."
sudo pacman -S imagemagick --noconfirm

# Yazi - ⚡️ Blazing Fast Terminal File Manager
printf "\nyazi..."
sudo pacman -S yazi --noconfirm

# printf "\nInstalling power analyzer..."
# sudo pacman -S powertop --noconfirm

# printf "\nInstalling hd memory analyzer..."
# sudo pacman -S ncdu --noconfirm

# printf "\nInstalling bluetoooth...\n..."
# sudo pacman -S bluez bluez-utils pulseaudio-bluetooth --noconfirm
# printf "\nStarting/Enabling bluetooth service...\n"
# sudo systemctl start bluetooth.service
# sudo systemctl enable bluetooth.service

# Make capslock a leftctrl.
# cd /etc/udev/hwdb.d
# ln -s ~/dotfiles/70-keyboard-my.hwdb 70-keyboard-my.hwdb
# systemd-hwdb update
# udevadm trigger

# Node.
curl -L https://git.io/n-install | bash

# Links.
ln -s ~/dotfiles/babelrc ~/.babelrc
rm ~/.bashrc
ln -s ~/dotfiles/bashrc_asus ~/.bashrc
ln -s ~/dotfiles/eslintrc.json ~/.eslintrc.json
ln -s ~/dotfiles/jshintrc ~/.jshintrc
ln -s ~/dotfiles/zshrc ~/.zshrc
sudo ln -s ~/dotfiles/golang.sh /etc/profile.d/golang.sh
