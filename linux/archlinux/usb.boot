# Create a boot usb.
$ dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync
