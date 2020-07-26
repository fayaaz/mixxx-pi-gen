# Enable ssh.
touch ${ROOTFS_DIR}/boot/ssh

# Boot to gui by default
on_chroot << EOF
	systemctl set-default graphical.target
	ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
EOF

install -m 644 files/autologin.conf ${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf

# Set up sudoers.d for user patch
rm -f ${ROOTFS_DIR}/etc/sudoers.d/010_pi-nopasswd
install -m 440 files/010_pi-nopasswd ${ROOTFS_DIR}/etc/sudoers.d/
