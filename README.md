# mixxx-pi-gen

_Mixxx image for the raspberry pi_

 [![Get the latest release](https://img.shields.io/github/release-date/fayaaz/mixxx-pi-gen)](https://github.com/fayaaz/mixxx-pi-gen/releases/latest)
![GitHub All Releases](https://img.shields.io/github/downloads/fayaaz/mixxx-pi-gen/total)

This repo is for the generation of a raspbian image for Mixxx.
Included:
- Mixxx 2.4 beta built from the [Mixxx](https://mixxx.org) repo
- 64 bit Raspberry Pi OS (Debian 12 "bookworm")
- preempt=full commandline argument on standard kernel and performance CPU governer as standard
- sway (i3 for wayland) window manager with autostart to Mixxx
- Working OpenGL waveforms
- Extra skins included for small screen by @dennisdebel and @timewasternl
- waybar and (useful) buttons
- wallpaper from Unsplash by [Daniel Olah](https://unsplash.com/@danesduet?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash)

## How to install on your Raspberry Pi 3/4/400/5

- If you're familiar with flashing an SD card for the Pi, please follow whatever method you normally use. 

The instructions below use Balena Etcher:

1. Get Balena Etcher: [https://www.balena.io/etcher/](https://www.balena.io/etcher/)
2. Download the [latest release mixxx-pi zip](https://github.com/fayaaz/mixxx-pi-gen/releases/latest)
3. Make sure your SD card is connected to the computer
4. Open Balena Etcher
5. Select 'Flash from File' and pick the zip you downloaded earlier
6. Select the SD card to flash to (check here that you're not overwriting something important!)
7. Hit 'Flash!' and wait for it to be verified.
8. Remove the SD card and transfer it to your raspberry pi
9. Turn on the raspberry pi (make sure it's plugged into a screen) and wait until mixxx shows up

### Important for running on Pi3 - remove threadirqs from boot commandline
NOT REQUIRED FOR VERSIONS v0.9.0 AND ONWARDS
Instructions left for older versions

Between step 7 and 8 in the instructions above (after the SD card is flashed with the image but before you run it the first time on your Pi3). Open up /boot/cmdline.txt on whatever PC you used to do the flash, and remove the threadirqs part from the end of the line. Do not remove the whole line.

It should look like this:
```
console=serial0,115200 console=tty1 root=ROOTDEV rootfstype=ext4 fsck.repair=yes rootwait quiet init=/usr/lib/raspi-config/init_resize.sh
```

This disables `threadirqs` option which causes a kernel panic on the Pi3.

### Optional steps:

1. Use scp to copy music to the RPI after plugging in ethernet (username: `pi`, password: `mixxx`, home dir: `/home/pi/`) or plug in a usb stick
2. WARNING do this at your own risk - this can corrupt your SD card or worse!! 
Overclock the raspberry pi. I found that as long as it has some sort
of cooling solution an overclock to 2GHz on the Pi4 was completely stable. 
I found adding this to your `/boot/config.txt` was stable:

```
over_voltage=6
arm_freq=2000
gpu_freq=750
```

Make sure you restart to see its effects. You will need a good power supply to ensure undervolting does not happen.

Extra debugging:

Plugging in a keyboard and hitting `alt+enter` will give you a terminal.
Logs for mixxx are available at: /home/pi/.mixxx/mixxx.log

Original instructions of forked repo are in [pi-gen-readme](pi-gen-readme.md)
