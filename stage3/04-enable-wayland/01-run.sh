# Enable wayland
on_chroot << EOF
	SUDO_USER=pi raspi-config nonint do_boot_behaviour B4
	raspi-config nonint do_xcompmgr 0
	SUDO_USER=pi raspi-config nonint do_wayland W2
EOF

# Remove cups
on_chroot << EOF
    apt-get purge -y cups cups-common system-config-printer printer-driver-* pocketsphinx-* pi-printer-support
    apt-get autoremove -y
EOF

# Mask pipewire services
on_chroot << EOF
    systemctl mask pipewire
    systemctl mask pipewire-pulse
    systemctl mask wireplumber
    systemctl mask --global pipewire
    systemctl mask --global pipewire-pulse
    systemctl mask --global wireplumber
    mkdir -p /home/pi/.config/systemd/user/
    ln -sf /dev/null /home/pi/.config/systemd/user/pipewire.service
    ln -sf /dev/null /home/pi/.config/systemd/user/pipewire.socket
    ln -sf /dev/null /home/pi/.config/systemd/user/pipewire-pulse
    ln -sf /dev/null /home/pi/.config/systemd/user/pipewire-pulse.socket
    ln -sf /dev/null /home/pi/.config/systemd/user/wireplumber
    ln -sf /dev/null /home/pi/.config/systemd/user/pulseaudio.service
    ln -sf /dev/null /home/pi/.config/systemd/user/pulseaudio.socket
EOF
