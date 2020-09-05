# Select this dir for KERNEL

echo "Starting cleaner for kernel and outcome"
echo ""
echo "Please wait as it can take some time."
cd source
make clean
make mrproper
make clean O=../outcome/kernel
make mrproper O=../outcome/kernel
