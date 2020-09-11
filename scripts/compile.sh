# Select this dir for KERNEL

echo "Starting compile for kernel"
cd source
make O=../outcome/kernel $DEFCONFIG
make O=../outcome/kernel
