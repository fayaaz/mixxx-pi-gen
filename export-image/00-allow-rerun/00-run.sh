#!/bin/bash -e

if [ ! -x "${ROOTFS_DIR}/usr/bin/qemu-arm" ]; then
	cp /usr/bin/qemu-arm "${ROOTFS_DIR}/usr/bin/"
fi

if [ -e "${ROOTFS_DIR}/etc/ld.so.preload" ]; then
	mv "${ROOTFS_DIR}/etc/ld.so.preload" "${ROOTFS_DIR}/etc/ld.so.preload.disabled"
fi
