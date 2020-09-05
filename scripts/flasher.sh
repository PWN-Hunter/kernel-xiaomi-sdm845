# Select this dir for KERNEL

cd flasher

echo "cleaning old images/zips"
rm -rf Image.gz-dtb
rm -rf modules/vendor/lib/modules/*
rm -rf flasher/flasher.zip
echo "done cleaning"

echo "Starting the creation of flashable.zip"
cp -rf ../outcome/kernel/arch/arm64/boot/Image.gz-dtb Image.gz-dtb
cp -rf ../outcome/modules/lib/modules/*/* modules/vendor/lib/modules/
zip -0 -r ../outcome/flasher/flasher.zip .
echo ""
echo "TWRP flashable in outcome/flasher"
