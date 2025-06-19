#!/bin/bash

# OpenClash 预设脚本
# 提前下载 OpenClash 内核和规则文件到固件中

# 创建 OpenClash 目录
[ -d files/etc/openclash/core ] || mkdir -p files/etc/openclash/core

# OpenClash 内核下载地址
CLASH_META_URL="https://github.com/MetaCubeX/mihomo/releases/download/v1.18.8/mihomo-linux-arm64-v1.18.8.gz"
GEOIP_URL="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geoip.dat"
GEOSITE_URL="https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/geosite.dat"
COUNTRY_URL="https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb"

# 下载 Clash Meta 内核
wget -qO- $CLASH_META_URL | tar xOz > files/etc/openclash/core/clash_meta && chmod +x files/etc/openclash/core/clash_meta

# 下载 GeoIP 数据库
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat

# 下载 GeoSite 数据库
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# 下载 Country.mmdb
wget -qO- $COUNTRY_URL > files/etc/openclash/Country.mmdb

# 创建版本信息文件
echo "$(date '+%Y-%m-%d %H:%M:%S') - OpenClash 内核预设完成" > files/etc/openclash/core/core_version