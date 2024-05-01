#!/usr/bin/env bash

printf "\nSet maximum space for log files...\n"
sudo journalctl --vacuum-size=100M

printf "\nSarting/enabling datetime sync...\n"
sudo systemctl start systemd-timesyncd.service
sudo systemctl enable systemd-timesyncd.service

printf "\nCreating symbolic link to git configuration file...\n"
ln -s ~/dotfiles/gitconfig ~/.gitconfig

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

printf "\nCreating symbolic link to mocp configuration file..."
mkdir -p ~/.moc
ln -s ~/dotfiles/moc/config ~/.moc/config

printf "\nInstalling jq..."
sudo pacman -S jq --noconfirm

# printf "\nInstalling youtube download..."
# sudo pacman -S youtube-dl --noconfirm

printf "\nInstalling terminal multiplex..."
sudo pacman -S tmux --noconfirm

printf "\nSet tmux configuration symbolic link..."
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

printf "\nInstalling process monitor..."
sudo pacman -S htop --noconfirm

printf "\nInstalling python 2..."
sudo pacman -S python2 python2-pip --noconfirm

printf "\nInstalling python 3..."
sudo pacman -S python python-pip --noconfirm

# printf "\nInstalling power analyzer..."
# sudo pacman -S powertop --noconfirm

# printf "\nInstalling hd memory analyzer..."
# sudo pacman -S ncdu --noconfirm

printf "\nInstalling bluetoooth...\n..."
sudo pacman -S bluez bluez-utils pulseaudio-bluetooth --noconfirm
printf "\nStarting/Enabling bluetooth service...\n"
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

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
