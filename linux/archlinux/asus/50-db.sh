printf "\nInstalling redis..."
sudo pacman -S redis --noconfirm
# Default port - 6379
# sudo systemctl enable redis
# sudo systemctl start redis

# printf "\nInstalling power analyzer..."
# sudo pacman -S powertop --noconfirm

# printf "\nInstalling hd memory analyzer..."
# sudo pacman -S ncdu --noconfirm

printf "\nInstalling postgresql...\n"
sudo pacman -S postgresql
# include into /etc/pacman.conf:
#   IgnorePkg = postgresql postgresql-libs
# To avoid update database to incompatilbe version

# sudo -iu postgres
# [postgres]$ initdb -D /var/lib/postgres/data
# [postgres]$ exit
# sudo systemctl start postgresql

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
