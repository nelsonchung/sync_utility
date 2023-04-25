#!/bin/bash
echo "1. Do configuration"
echo "2. Build the kernel source/device tress"
echo "3. Sync the modules/device tree/kernel image to /boot"

read option

case "$option" in
    "1")
        KERNEL=kernel8
        make bcm2711_defconfig

    ;;
    "2")
        make -j4 Image.gz modules dtbs
    ;;
    "3")
        KERNEL=kernel8
        sudo make modules_install
        sudo cp arch/arm64/boot/dts/broadcom/*.dtb /boot/
        sudo cp arch/arm64/boot/dts/overlays/*.dtb* /boot/overlays/
        sudo cp arch/arm64/boot/dts/overlays/README /boot/overlays/
        sudo cp arch/arm64/boot/Image.gz /boot/$KERNEL.img
    ;;
    *)
    echo "Not support"
    exit 1
    ;;
esac
