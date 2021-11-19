
printf "\nCreating symbolic link to st configuration...\n"
rm ~/aur/st-git/src/st/config.h
ln -s ~/dotfiles/st/config.h ~/aur/st-git/src/st/config.h
printf "\nRecompiling st with new configuration file...\n"
cd ~/aur/st-git
makepkg -fi
