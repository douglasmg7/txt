# # Install firefox.
# printf "\nInstalling Firefox..."
# sudo pacman -S firefox flashplugin --noconfirm
# # If flash sound not work.
# # pacman -S libvdpau-va-gl

printf "\nInstalling chromium..."
sudo pacman -S chromium

# printf "\nInstalling surf..."
# sudo pacman -S surf tabbed --noconfirm
# # To run with tab: $tabbed surf -e

# File manager.
printf "\nInstalling file manager..."
sudo pacman -S pcmanfm --noconfirm

# Pdf readers.
printf "\nInstalling pdf readers..."
sudo pacman -S evince mupdf apvlv --noconfirm

# Image viewer
printf "\nInstalling image viewer..."
sudo pacman -S feh --noconfirm

# alsamixer and mixer.
printf "\nInstalling alsamixer and mixer..."
sudo pacman -S alsa-utils --noconfirm

# Sound server.
printf "\nInstalling sound server..."
sudo pacman -S pulseaudio pulseaudio-alsa --noconfirm

printf "\nInstalling pulse audio interface (cli)..."
sudo pacman -S pamixer --noconfirm

printf "\nInstalling pulse audio interface (gui)..."
sudo pacman -S pavucontrol --noconfirm

printf "\nInstalling mpg124..."
sudo pacman -S mpg123 --noconfirm

printf "\nInstalling mplayer..."
sudo pacman -S mplayer --noconfirm

printf "\nInstalling transmission-gtk..."
sudo pacman -S transmission-gtk --noconfirm

# printf "\nInstalling libs to play encrypted DVDs..."
# sudo pacman -S libdvdread libdvdcss libdvdnav --noconfirm

# printf "\nInstalling cdparanoia (cd ripper)..."
# sudo pacman -S cdparanoia --noconfirm

printf "\nInstalling unrar..."
sudo pacman -S unrar --noconfirm

printf "\nInstalling unzip..."
sudo pacman -S unzip --noconfirm

printf "\nInstalling mkfs.vfat..."
sudo pacman -S dosfstools --noconfirm

printf "Cloning simple-mtpfs, mtp (media transfer protocol) to connect to Android phone..."
git clone https://aur.archlinux.org/simple-mtpfs.git ~/aur/simple-mtpfs.git
cd ~/aur/simple-mtpfs
printf "\nInstalling simple-mtpfs..."
makepkg -si

# For joystick calibration.
printf "\nInstalling joyutils..."
sudo pacman -S joyutils --noconfirm

printf "\nArduino ide and cli..."
sudo pacman -S arduino arduino-cli --noconfirm
printf "\nCreating symbolic link to jre configuration for arduino window correction."
ln -s ~/dotfiles/arduino.sh /etc/profile.d/arduino.sh
