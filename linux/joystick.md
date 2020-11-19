# Joystick utilities

## Install jscal, jstest, and jsattach utilities for the Linux joystick driver
```bash
sudo pacman -S joyutils
```

## See current joysticks
```bash
ls /dev/input/js*
```

## Test joystick
```bash
jstest /dev/input/js0
```

## Calibrate joystick
```bash
jscal -c /dev/input/js0

```

## Generate script to set actual calibration
```bash
sudo jscal -p /dev/input/js0 > jscal.sh

```

## Call before start the game
```bash
./jscal.sh
```