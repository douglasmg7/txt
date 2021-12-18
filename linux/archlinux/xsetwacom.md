# Configure Wacom tablet

# List devices
# xsetwacom list devices

## Install:
sudo pacman -S xf86-input-wacom

# Use this configuration for ultra widescreen at right and wacom with usb plug to right:
xsetwacom set  11 rotate half
xsetwacom set 11 area  0 0 26610 9500

# List commands
xsetwacom list parameters

# Get all current parameters
xsetwacom get $DEVICEID all

# Set a parameter
xsetwacom set $DEVICEID $PARAMETER $VALUE

# Set to relative mode
xsetwacom set 11 mode relative
xsetwacom set 11 mode absolute

# Set area
xsetwacom set 11 area  0 0 80000 80000
xsetwacom set 11 area  0 0 15200 9500
xsetwacom set 11 ResetArea

# Set rotation
xsetwacom set  11 rotate half

