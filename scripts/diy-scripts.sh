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

# 修改默认IP
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i 's/OpenWrt/R66S/g' package/base-files/files/bin/config_generate

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

# 移除要替换的包+
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-mosdns

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

git clone --depth=1 https://github.com/sirpdboy/luci-app-adguardhome package/luci-app-adguardhome

git clone --depth=1 https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone --depth=1 https://github.com/morytyann/OpenWrt-mihomo package/luci-app-mihomo
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash

git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git_sparse_clone main https://github.com/haiibo/packages luci-theme-opentomcat

git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

git clone --depth=1 -b v5-lua https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns