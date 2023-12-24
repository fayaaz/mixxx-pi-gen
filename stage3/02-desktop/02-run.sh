# Add i3/sway config file
mkdir -p -m 755 ${ROOTFS_DIR}/home/pi/.config/sway/
install -m 755 files/i3.conf ${ROOTFS_DIR}/home/pi/.config/sway/config
cp -r files/wallpaper ${ROOTFS_DIR}/home/pi/
cp -r files/i3blocks ${ROOTFS_DIR}/home/pi/.config/
on_chroot << EOF
    chown -R pi:root /home/pi/.config/
    chmod -R 755 /home/pi/.config/
EOF
