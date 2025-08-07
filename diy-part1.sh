#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# 更新 Sing-box：删除原有版本并克隆最新版
echo "==> 更新 sing-box 到最新版本"
rm -rf feeds/packages/net/sing-box
git clone --depth 1 --no-checkout https://github.com/immortalwrt/packages.git tmp-sing-box
cd tmp-sing-box
mv net/sing-box ../feeds/packages/net/
cd ..
rm -rf tmp-sing-box
