install -m 644 files/lightdm.ini ${ROOTFS_DIR}/etc/lightdm/lightdm.conf

# Make sure pi owns its config files
on_chroot << EOF
    chown -R pi:root /home/pi/.config/
    chmod -R 755 /home/pi/.config/
EOF

# Set performance governor
rm ${ROOTFS_DIR}/usr/lib/udev/rules.d/60-ondemand-governor.rules
install -m 644 files/60-performance-governor.rules ${ROOTFS_DIR}/usr/lib/udev/rules.d/60-performance-governor.rules
