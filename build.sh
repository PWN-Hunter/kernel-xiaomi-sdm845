#!/bin/bash

# Select arch
export ARCH=arm64
export SUBARCH=arm64
export ROMDIR=$(pwd)

# Use GCC toolchains from this dir
KERNEL_TOOLCHAIN=$ROMDIR/toolchain/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
ARM32_TOOLCHAIN=$ROMDIR/toolchain/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
CLANG_TOOLCHAIN=$ROMDIR/toolchain/clang_custom/bin/clang-11

export CROSS_COMPILE=$KERNEL_TOOLCHAIN
export CROSS_COMPILE_ARM32=$ARM32_TOOLCHAIN
export DEFCONFIG=skull_defconfig
# gna check if dialog is installed

if [ $(dpkg-query -W -f='${Status}' dialog 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo "run deps.sh";
  exit 1
fi


HEIGHT=30
WIDTH=80
CHOICE_HEIGHT=30
BACKTITLE="Kernel compiler script"
TITLE=""
MENU="Choose one of the following options:"

OPTIONS=(1 "Menuconfig"
         2 "Build kernel"
         3 "Build modules and headers"
         4 "Zip the flasher"
         5 "Clean everything"
         6 "Remove outcome for kernel and modules"
         7 "Exit"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Menuconfig ($DEFCONFIG)"
            ./scripts/menuconfig.sh
            ;;
        2)
            echo "Building kernel"
            ./scripts/compile.sh
            ;;
        3)
            echo "Building modules and headers"
            ./scripts/modules.sh
            ;;
        4)
            echo "Gna zip the installer"
            ./scripts/flasher.sh
            ;;
        5)
            echo "Cleaning everything that you have done in source and outcome"
            ./scripts/cleaner.sh
            ;;
        6)
            echo "Delete outcome kernel and modules"
            ./scripts/destroy.sh
            ;;
        7)
            echo "Bye."
            exit 1
            ;;
esac
