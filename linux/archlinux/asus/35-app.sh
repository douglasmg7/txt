# # Install firefox.
# printf "\nInstalling Firefox..."
# sudo pacman -S firefox flashplugin --noconfirm
# # If flash sound not work.
# # pacman -S libvdpau-va-gl

# printf "\nInstalling chromium..."
# sudo pacman -S chromium --noconfirm

printf "\nInstalling firefox..."
sudo pacman -S firefox --noconfirm
# Set startup to not load all pin tabs.
# about:config
# browser.sessionstore.restore_pinned_tabs_on_demand (pinned tabs)(false)
# browser.sessionstore.restore_on_demand (default as set in Options -> Tabs)(true)
# browser.sessionstore.restore_hidden_tabs (tabs in other tab groups)(false)

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

# printf "Cloning simple-mtpfs, mtp (media transfer protocol) to connect to Android phone..."
# git clone https://aur.archlinux.org/simple-mtpfs ~/aur/simple-mtpfs
# cd ~/aur/simple-mtpfs
# printf "\nInstalling simple-mtpfs..."
# makepkg -si

# For joystick calibration.
printf "\nInstalling joyutils..."
sudo pacman -S joyutils --noconfirm

# printf "\nArduino ide and cli..."
# sudo pacman -S arduino arduino-cli --noconfirm
# printf "\nCreating symbolic link to jre configuration for arduino window correction."
# sudo ln -s ~/dotfiles/arduino.sh /etc/profile.d/arduino.sh

# printf "\nInstalling inkscape..."
# sudo pacman -S inkscape python-lxml python-cssselect --noconfirm

# printf "\nInstalling gimp..."
# sudo pacman -S gimp --noconfirm

# printf "\nInstalling blender..."
# sudo pacman -S blender --noconfirm

printf "\nInstalling docker and docker-compose..."
sudo pacman -S docker docker-compose --noconfirm
sudo usermod -aG docker dmg

# printf "\nInstalling virtualbox, choose option 2=virtualbox-host-modules-arch"
# sudo pacman -S virtualbox 
# sudo pacman -S virtualbox-guest-utils
# sudo pacman -S virtualbox-guest-iso     # Will create /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso
# Download "Oracle VM VirtualBox Extension Pack" from https://www.virtualbox.org/wiki/Downloads and instal from File/Preferences/Extensions
# After install windows on virtualbox, create a optical drive from /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso
# So install the software to update display resolution.


# printf "\nInstalling freecad..."
# sudo pacman -S freecad --noconfirm

# printf "\nInstalling rawtherapee..."
# sudo pacman -S rawtherapee --noconfirm

echo "ManuallyInstall freecad from realthunder"
# echo "Download FreeCAD-asm3-Stable-Conda-Py3-Qt5-20210717-glibc2.12-x86_64.AppImage from https://github.com/realthunder/FreeCAD_assembly3/releases"
# echo "sudo mv FreeCAD-asm3-Stable-Conda-Py3-Qt5-20210717-glibc2.12-x86_64.AppImage /opt"
# echo "ln -s /opt/FreeCAD-asm3-Stable-Conda-Py3-Qt5-20210717-glibc2.12-x86_64.AppImage /usr/bin/freecad"

echo "ManuallyInstall miniconda from downloaded script"
# Download miniconda script to Install miniconda.
# https://docs.conda.io/en/latest/miniconda.html
# Conda configuration to not start activated.
# conda config --set auto_activate_base false

$ cd ~/aur
$ git clone https://aur.archlinux.org/packages/visual-studio-code-bin
$ cd visual-studio-code-bin
$ makepkg -si
