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
    su pi
    systemctl --user mask pipewire
    systemctl --user mask pipewire.socket
    systemctl --user mask pipewire-pulse
    systemctl --user mask pipewire-pulse.socket
    systemctl --user mask wireplumber
EOF
