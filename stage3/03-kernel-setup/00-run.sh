# Add preempt=full kernel command line argument
on_chroot << EOF
    sed -i 's/$/ preempt=full cpufreq.default_governor=performance/' /boot/firmware/cmdline.txt
EOF
