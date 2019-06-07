## Config files

### Install
```bash
cd ~
git clone https://github.com/douglasmg7/dotfiles.git

# atom.io editor config
mkdir ~/.atom && cd ~/.atom
ln -s ~/dotfiles/atom/config.cson config.cson
ln -s ~/dotfiles/atom/init.coffee init.coffee
ln -s ~/dotfiles/atom/keymap.cson keymap.cson
ln -s ~/dotfiles/atom/package.list package.list
ln -s ~/dotfiles/atom/snippets.cson snippets.cson
ln -s ~/dotfiles/atom/styles.less styles.less
ln -s ~/dotfiles/atom/terminal-commands.json terminal-commands.json
apm install --packages-file ~/.atom/package.list

# i3 windows manager
mkdir ~/.i3 && cd ~/.i3
ln -s ~/dotfiles/i3/config config

# dwm windows manager
mkdir aur && cd aur
git clone https://aur.archlinux.org/dwm-git.git
makepkg -si
ln -s ~/dotfiles/dwm/config.h ~/aur/dwm-git/src/dwm/config.h
makepkg -fi

# st - Simple Terminal.
cd aur
git clone https://aur.archlinux.org/st-git.git
makepkg -si
ln -s ~/dotfiles/st/config.h ~/aur/st-git/src/st/config.h
makepkg -fi

# Vim and Neovim.
ln -s ~/dotfiles/vimrc .vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Inside vim - :PluginInstall
mkdir -p ~/.config/nvim && cd ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim init.vim

# Ssh.
mkdir -p ~/.ssh && cd ~/.ssh
ln -s ~/dotfiles/ssh/config config
cp ~/dotfiles/ssh/ssh-agent.service .
systemctl --user enable ssh-agent.service

# others programs config
ln -s ~/dotfiles/babelrc .babelrc
ln -s ~/dotfiles/bashrc .bashrc
ln -s ~/dotfiles/eslintrc.json .eslintrc.json
ln -s ~/dotfiles/gitconfig .gitconfig
ln -s ~/dotfiles/ideavimrc.json .ideavimrc.json
ln -s ~/dotfiles/jshintrc .jshintrc
ln -s ~/dotfiles/tmux.conf .tmux.conf
ln -s ~/dotfiles/xinitrc .xinitrc
ln -s ~/dotfiles/Xresources .Xresources
ln -s ~/dotfiles/zshrc .zshrc
ln -s ~/dotfiles/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cd ~/.moc/
ln -s ~/dotfiles/moc/config .

# Map leftctrl to capslook keyboard
cd /usr/lib/udev/hwdb.d
cp ~/dotfiles/65-keyboard-my.hwdb 65-keyboard-my.hwdb
systemd-hwdb update
udevadm trigger
```
