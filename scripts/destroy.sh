# Select this dir for KERNEL

echo "Starting cleaner for kernel and removing outcome"
echo ""
echo "Please wait as it can take some time."
cd source
make clean
make mrproper
rm -rf ../outcome/kernel
mkdir ../outcome/kernel
rm -rf ../outcome/flasher/*
echo "DONE"
