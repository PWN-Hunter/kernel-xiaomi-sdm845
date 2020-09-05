# Select this dir for KERNEL

echo "Starting compile for kernel"
cd source/
make O=../outcome/kernel skull_defconfig
make O=../outcome/kernel menuconfig
cp -rf ../outcome/kernel/.config arch/arm64/configs/skull_defconfig
