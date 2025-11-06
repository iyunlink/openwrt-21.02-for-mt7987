cp defaults.conf .config
make defconfig
make V=s -j1
[ $? -ne 0 ] && {
    echo "make failed"
    exit 1
}
echo "make success"
exit 0
