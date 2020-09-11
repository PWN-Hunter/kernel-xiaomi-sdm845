# Select this dir for KERNEL

cd flasher/addition
mkdir ../../outcome/flasher
echo "cleaning old images/zips, just in case u pressed ctrl c"
rm -rf Image.gz-dtb
rm -rf modules/vendor/lib/modules/*
rm -rf flasher/flasher.zip
echo "done cleaning"

echo "Starting the creation of flashable.zip"
cp -rf ../../outcome/kernel/arch/arm64/boot/Image.gz-dtb Image.gz-dtb
cp -rf ../../outcome/modules/lib/modules/*/* modules/vendor/lib/modules/
rm -r modules/vendor/lib/modules/build
rm -r modules/vendor/lib/modules/source
zip -0 -r ../../outcome/flasher/flasher.zip .

# clean the flasher folder
rm -rf Image.gz-dtb
rm -rf modules/vendor/lib/modules/*

echo ""
echo "TWRP flashable in outcome/flasher"
