#!/bin/bash
# ==============================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# ===============================================================

# 修改默认IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i 's/OpenWrt/R66S/g' package/base-files/files/bin/config_generate

# 修改版本号
sed -i "s/OpenWrt /R66S Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改时区
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/system.@system\[0\].timezone/d" package/base-files/files/bin/config_generate
echo "        set system.@system[0].timezone='CST-8'" >> package/base-files/files/bin/config_generate
echo "        set system.@system[0].zonename='Asia/Shanghai'" >> package/base-files/files/bin/config_generate

# 添加自定义文件
if [ -d "files" ]; then
    cp -r files/* package/base-files/files/
fi