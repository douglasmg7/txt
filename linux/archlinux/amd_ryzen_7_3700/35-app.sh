# # Install firefox.
# printf "\nInstalling Firefox..."
# sudo pacman -S firefox flashplugin --noconfirm
# # If flash sound not work.
# # pacman -S libvdpau-va-gl

printf "\nInstalling chromium..."
sudo pacman -S chromium --noconfirm

printf "\nInstalling firefox..."
sudo pacman -S firefox --noconfirm

# printf "\nInstalling surf..."
# sudo pacman -S surf tabbed --noconfirm
# # To run with tab: $tabbed surf -e

# File manager.
printf "\nInstalling file manager..."
sudo pacman -S pcmanfm --noconfirm

# Pdf readers.
printf "\nInstalling pdf readers..."
sudo pacman -S evince mupdf --noconfirm

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
git clone https://aur.archlinux.org/simple-mtpfs ~/aur/simple-mtpfs
cd ~/aur/simple-mtpfs
printf "\nInstalling simple-mtpfs..."
makepkg -si

# For joystick calibration.
printf "\nInstalling joyutils..."
sudo pacman -S joyutils --noconfirm

printf "\nArduino ide and cli..."
sudo pacman -S arduino arduino-cli --noconfirm
printf "\nCreating symbolic link to jre configuration for arduino window correction."
sudo ln -s ~/dotfiles/arduino.sh /etc/profile.d/arduino.sh

printf "\nInstalling Wacom tablet dependencies..."
sudo pacman -S xf86-input-wacom --noconfirm

printf "\nInstalling inkscape..."
sudo pacman -S inkscape python-lxml python-cssselect --noconfirm

printf "\nInstalling gimp..."
sudo pacman -S gimp --noconfirm

printf "\nInstalling blender..."
sudo pacman -S blender --noconfirm

printf "\nInstalling docker..."
sudo pacman -S docker --noconfirm
sudo usermod -aG docker douglasmg7

printf "\nInstalling virtualbox, choose option 2=virtualbox-host-modules-arch"
sudo pacman -S virtualbox 
sudo pacman -S virtualbox-guest-utils
sudo pacman -S virtualbox-guest-iso     # Will create /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso
# Enable AMD-V on bios
#   Del to enter BIOS
#   M.I.T > Advanced Frequency Dettings > Advanced CPU Settings > SVM Mode > Enable
# After install windows on virtualbox, create a optical drive from /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso
# So install the software to update display resolution.


# printf "\nInstalling freecad..."
# sudo pacman -S freecad --noconfirm

printf "\nInstalling rawtherapee..."
sudo pacman -S rawtherapee --noconfirm

echo "Download FreeCAD-asm3-Stable-Conda-Py3-Qt5-20210717-glibc2.12-x86_64.AppImage from https://github.com/realthunder/FreeCAD_assembly3/releases"
echo "sudo mv FreeCAD-asm3-Stable-Conda-Py3-Qt5-20210717-glibc2.12-x86_64.AppImage /opt"
echo "ln -s /opt/FreeCAD-asm3-Stable-Conda-Py3-Qt5-20210717-glibc2.12-x86_64.AppImage /usr/bin/freecad"
