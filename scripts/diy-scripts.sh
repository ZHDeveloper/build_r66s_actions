#!/bin/bash
# ==============================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-scripts.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# ===============================================================

# 修改默认IP - 支持多种配置文件位置
# 方法1: 修改 config_generate (LEDE/OpenWrt 标准位置)
if [ -f "package/base-files/files/bin/config_generate" ]; then
    sed -i 's/OpenWrt/R66S/g' package/base-files/files/bin/config_generate
    sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate
    echo "已修改 config_generate 中的默认IP"
fi

# 方法2: 修改 zzz-default-settings (LEDE 特有)
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
    sed -i 's/OpenWrt/R66S/g' package/lean/default-settings/files/zzz-default-settings
    sed -i 's/192.168.1.1/192.168.100.1/g' package/lean/default-settings/files/zzz-default-settings
    echo "已修改 zzz-default-settings 中的默认IP"
fi

# 方法3: 修改 system 配置文件 (ImmortalWrt 可能使用)
if [ -f "package/base-files/files/etc/config/system" ]; then
    sed -i "s/OpenWrt/R66S/g" package/base-files/files/etc/config/system
    sed -i "s/192.168.1.1/192.168.100.1/g" package/base-files/files/etc/config/system
    echo "已修改 system 配置文件中的默认IP"
fi

# 方法4: 创建自定义的 uci-defaults 脚本来确保IP设置
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/99-custom-ip << 'EOF'
#!/bin/sh
# 设置默认IP地址
uci set system.@system[0].hostname='R66S'
uci set network.lan.ipaddr='192.168.100.1'
uci commit network
exit 0
EOF

# 修改版本号 (仅在 LEDE 源码中存在)
if [ -f "package/lean/default-settings/files/zzz-default-settings" ]; then
    sed -i "s/OpenWrt /R66S Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
fi

# 修改时区
sed -i "s/'UTC'/'CST-8'/g" package/base-files/files/bin/config_generate
sed -i "/system.@system\[0\].timezone/d" package/base-files/files/bin/config_generate
echo "        set system.@system[0].timezone='CST-8'" >> package/base-files/files/bin/config_generate
echo "        set system.@system[0].zonename='Asia/Shanghai'" >> package/base-files/files/bin/config_generate

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 晶晨宝盒
git_sparse_clone main https://github.com/ophub/luci-app-amlogic luci-app-amlogic
sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/$GITHUB_REPOSITORY'|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|$RELEASE_TAG|g" package/luci-app-amlogic/root/etc/config/amlogic

# 调整 Docker 到 服务 菜单
sed -i 's/"admin"/"admin", "services"/g' feeds/luci/applications/luci-app-dockerman/luasrc/controller/*.lua
sed -i 's/"admin"/"admin", "services"/g; s/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
sed -i 's/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/*.htm
sed -i 's|admin\\|admin\\/services\\|g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/container.htm

# 添加自定义文件
if [ -d "files" ]; then
    cp -r files/* package/base-files/files/
fi
