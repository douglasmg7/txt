# Install ssh client.

printf "\nInstalling ssh client..."
sudo pacman -S openssh --noconfirm

printf "\nEnabling ssh server..."
sudo systemctl enable sshd
sudo systemctl start sshd

printf "\nCreating symbolic link to ssh configuration file...\n"
mkdir -p ~/.ssh
ln -s ~/dotfiles/ssh/config ~/.ssh/config
cp ~/dotfiles/ssh/ssh-agent.service ~/.ssh/ssh-agent.service
# todo - not working.
systemctl --user enable ssh-agent.service
# Copy public key to remote server:
$ ssh-copy-id vps10092.publiccloud.com.br
# If user differ on remote machine:
$ ssh-copy-id douglasmg7@vps10092.publiccloud.com.br
# Test connection. 
$ ssh vps10092.publiccloud.com.br
