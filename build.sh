for file in `cat ./feeds/mtk_openwrt_feed/21.02/remove_list-mtwifi.txt`; do
    rm -rf $file
done

cp -af ./feeds/mtk_openwrt_feed/21.02/files/* .
cp -af ./feeds/mtk_openwrt_feed/tools .
for file in $(find ./feeds/mtk_openwrt_feed/21.02/patches-base -name "*.patch" | sort); do patch -f -p1 -i ${file}; done
for file in $(find ./feeds/mtk_openwrt_feed/21.02/patches-feeds -name "*.patch" | sort); do patch -f -p1 -i ${file}; done