# Cd into kernel source

cd source

echo "Deleting old modules"
rm -rf ../outcome/modules/*
rm -rf ../outcome/headers/*

echo "Starting compile"
make O=../outcome/kernel skull_defconfig

make O=../outcome/kernel modules_install INSTALL_MOD_PATH=../modules

make O=../outcome/kernel modules_prepare

make O=../outcome/kernel modules INSTALL_MOD_PATH=../modules

make O=../outcome/kernel modules_install INSTALL_MOD_PATH=../modules

make O=../outcome/kernel headers_install INSTALL_HDR_PATH=../headers
