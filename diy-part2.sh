#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/Sheep-Router/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/net/adguardhome
rm -rf feeds/luci/applications/luci-app-adguardhome
rm -rf feeds/luci/applications/luci-app-homeproxy
git clone --depth 1 https://github.com/immortalwrt/homeproxy package/luci-app-homeproxy
echo "==> 使用 kenzok8 的 adguardhome"
git clone --depth 1 https://github.com/kenzok8/openwrt-packages tmp-kenzo
mv tmp-kenzo/luci-app-adguardhome package/
mv tmp-kenzo/adguardhome package/
rm -rf tmp-kenzo
echo "==> 更新 sing-box 到最新版本"
rm -rf feeds/packages/net/sing-box
git clone --depth 1 https://github.com/immortalwrt/packages tmp-sing-box
cd tmp-sing-box
mv net/sing-box ../feeds/packages/net/
cd ..
rm -rf tmp-sing-box
