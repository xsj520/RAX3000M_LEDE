#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# ==========================
# 1️⃣ 添加官方 feed
# ==========================
# DDNSTO 官方 feed
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default

# 其他常用 feed
echo 'src-git modem https://github.com/FUjr/modem_feeds.git;main' >> feeds.conf.default
echo 'src-git mt5700webui https://github.com/aliass532/mt5700webui-openwrt-server.git;main' >> feeds.conf.default

# ==========================
# 2️⃣ 安装 feed
# ==========================
./scripts/feeds update -a
./scripts/feeds install -a

# ==========================
# 3️⃣ 添加第三方 feed (可选)
# ==========================
# git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages

# ==========================
# 4️⃣ 编译时默认选中 DDNSTO
# ==========================
# 可在 diy-part2.sh 或这里写
echo "CONFIG_PACKAGE_ddnsto=y" >> .config
echo "CONFIG_PACKAGE_luci-app-ddnsto=y" >> .config

# ==========================
# 5️⃣ 完成
# ==========================
echo "✅ DDNSTO feed 已添加，编译时会自动集成 ddnsto 和 luci-app-ddnsto"
