#!/bin/bash
set -e
./scripts/feeds update -a
./scripts/feeds install -a

echo "=========================================="
echo "Apply patches-feeds patches"
echo "=========================================="

PATCHES_FEEDS=(
    "107-strongswan-5_9_11-upgrade.patch"
    "150-ksmbd-sess-user-check.patch"
    "151-ksmbd-multiple-vulnerabilities-fix.patch"
    "152-lftp-download-url.patch"
    "160-cryptsetup-add-host-build.patch"
    "161-update-mmc-utils-to-2024-03-05-version.patch"
)

for patch_file in "${PATCHES_FEEDS[@]}"; do
    patch_path="package/mtk-openwrt-feeds/21.02/patches-feeds/${patch_file}"
    if [ -f "$patch_path" ]; then
        if patch --dry-run -p1 -s -f -i "$patch_path" > /dev/null 2>&1; then
            echo "→ [Applying] $patch_file"
            patch -p1 -i "$patch_path"
        else
            echo "⚠ [Conflict, skipping] $patch_file"
        fi
    fi
done


echo ""
echo "=========================================="
echo "Apply patches-base patches"
echo "=========================================="

PATCHES_BASE=(
    "140-nand-dual-boot-upgrade.patch"
)

for patch_file in "${PATCHES_BASE[@]}"; do
    patch_path="package/mtk-openwrt-feeds/21.02/patches-base/${patch_file}"
    if [ -f "$patch_path" ]; then
        if patch --dry-run -p1 -s -f -i "$patch_path" > /dev/null 2>&1; then
            echo "→ [Applying] $patch_file"
            patch -p1 -i "$patch_path"
        else
            echo "⚠ [Conflict, skipping] $patch_file"
        fi
    fi
done

echo ""
echo "Patches applied successfully!"
echo ""

echo "=========================================="
echo "Build OpenWrt"
echo "=========================================="

[ ! -f .config ] && cp defaults.config .config
make defconfig
make V=s -j1
[ $? -ne 0 ] && {
    echo "make failed"
    exit 1
}
echo "make success"
exit 0
