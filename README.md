# Study reminders

## 70-keyboard-my.hwdb
Map leftctrl to capslook keyboard
    cd /etc/udev/hwdb.d
    ln -s ~/dotfiles/70-keyboard-my.hwdb 70-keyboard-my.hwdb
    systemd-hwdb update
    udevadm trigger
