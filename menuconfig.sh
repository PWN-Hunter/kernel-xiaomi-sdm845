export ARCH=arm64

export SUBARCH=arm64

make O=../out skull_defconfig
make O=../out menuconfig
cp -rf ../out/.config arch/arm64/configs/skull_defconfig
echo " "
echo " "
echo " "
echo "DONE, BYE"
