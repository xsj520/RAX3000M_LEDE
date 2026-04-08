#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
==============================================
 # 1. 强制删除所有 Rust 相关配置（覆盖原有=y的配置）
 sed -i '/CONFIG_PACKAGE_rust/d' .config
 sed -i '/CONFIG_PACKAGE_rust-std/d' .config
 sed -i '/CONFIG_PACKAGE_cargo/d' .config
 sed -i '/CONFIG_PACKAGE_rustc/d' .config
 sed -i '/CONFIG_PACKAGE_librustc/d' .config
 sed -i '/CONFIG_PACKAGE_librust-std/d' .config
 # 2. 禁用依赖 Rust 的软件包（按需保留/删除）
 sed -i '/CONFIG_PACKAGE_modns/d' .config
 sed -i '/CONFIG_PACKAGE_luci-app-modns/d' .config
 sed -i '/CONFIG_PACKAGE_tailscale/d' .config
 sed -i '/CONFIG_PACKAGE_luci-app-tailscale/d' .config
 # 3. 写入禁用配置（确保彻底关闭）
 echo "CONFIG_PACKAGE_rust=n" >> .config
 echo "CONFIG_PACKAGE_rust-std=n" >> .config
 echo "CONFIG_PACKAGE_cargo=n" >> .config
 echo "CONFIG_PACKAGE_rustc=n" >> .config
 # 4. 刷新配置，确保生效（关键步骤！）
 make defconfig
 # ==============================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate



# 修改版本为编译日期
# date_version=$(date +"%y.%m.%d")
# orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
# sed -i "s/${orig_version}/R${date_version} by xsj/g" package/lean/default-settings/files/zzz-default-settings

# git_sparse_clone main https://github.com/Lienol/openwrt-package luci-app-filebrowser
# 修改插件名字
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"iStore"/"商店"/g' `grep "iStore" -rl ./`
sed -i 's/"Docker"/"容器"/g' `grep "Docker" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`

sed -i 's/"上网时间控制"/"上网控制"/g' `grep "上网时间控制" -rl ./`
sed -i 's/"启动项"/"启动项目"/g' `grep "启动项" -rl ./`
sed -i 's/"挂载点"/"挂载地点"/g' `grep "挂载点" -rl ./`
sed -i 's/"重启"/"重启开关"/g' `grep "重启" -rl ./`
sed -i 's/"ShadowSocksR Plus+"/"科学上网"/g' `grep "ShadowSocksR Plus+" -rl ./`
# sed -i 's/"PassWall 2"/"Passwall"/g' `grep "PassWall 2" -rl ./`
sed -i 's/"防火墙"/"防火墙区"/g' `grep "防火墙" -rl ./`
sed -i 's/"主机名"/"主机名称"/g' `grep "主机名" -rl ./`
sed -i 's/"接口"/"接口设置"/g' `grep "接口" -rl ./`
sed -i 's/"无线"/"无线设置"/g' `grep "无线" -rl ./`

sed -i 's/"管理权"/"管理设置"/g' `grep "管理权" -rl ./`
sed -i 's/"软件包"/"软件包名"/g' `grep "软件包" -rl ./`
sed -i 's/"UPnP"/"U P N P"/g' `grep "UPnP" -rl ./`
sed -i 's/"动态 DNS"/"动态DNS"/g' `grep "动态 DNS" -rl ./`
sed -i 's/"路由表"/"路由器表"/g' `grep "路由表" -rl ./`
sed -i 's/"路由"/"路由设置"/g' `grep "路由" -rl ./`
sed -i 's/"备份与升级"/"备份升级"/g' `grep "备份与升级" -rl ./`
sed -i 's/"FileBrowser"/"文件管理"/g' `grep "FileBrowser" -rl ./`
sed -i 's/"终端"/"终端命令"/g' `grep "终端" -rl ./`
sed -i 's/"QoS"/"网络控制"/g' `grep "QoS" -rl ./`
sed -i 's/"Watchcat"/"断网重启"/g' `grep "Watchcat" -rl ./`
sed -i 's/"Control"/"限速"/g' `grep "Control" -rl ./`
