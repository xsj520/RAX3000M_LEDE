#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)


# 其他常用 feed
# echo 'src-git modem https://github.com/FUjr/modem_feeds.git;main' >> feeds.conf.default
# echo 'src-git mt5700webui https://github.com/aliass532/mt5700webui-openwrt-server.git;main' >> feeds.conf.default


# 3️⃣ 添加第三方 feed (可选)

# git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages

#先删除源码里面自带旧argon主题
rm -rf package/luci-theme-argon

#再重新拉取官方新版本
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# ↓↓ 紧接着这里粘贴你的sed删除footer代码！
LOGIN_HTML="./package/luci-theme-argon/luci/templates/login.htm"
if [ -f "$LOGIN_HTML" ]; then
    sed -i '/<div class="login-footer">/,/<\/div>/d' "${LOGIN_HTML}"
fi
