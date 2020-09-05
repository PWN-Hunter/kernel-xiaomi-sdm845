# Select this dir for KERNEL

echo "cleaning old images/zips"
rm -rf flasher/Image.gz-dtb
rm -rf flasher/modules/vendor/lib/modules/*
rm -rf flasher/flasher.zip
echo "done cleaning"

echo "Starting the creation of flashable.zip"
cp -rf outcome/kernel/arch/arm64/boot/Image.gz-dtb flasher/Image.gz-dtb
cp -fr outcome/modules
