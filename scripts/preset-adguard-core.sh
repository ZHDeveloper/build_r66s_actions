#!/bin/bash

# AdGuard Home 预设脚本
# 提前下载 AdGuard Home 内核到固件中

# 创建目标目录
mkdir -p files/usr/bin/AdGuardHome

# 获取最新版本的 AdGuard Home for ARM64
AGH_CORE=$(curl -sL https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest | grep /AdGuardHome_linux_arm64 | awk -F '"' '{print $4}')

if [ -z "$AGH_CORE" ]; then
    exit 1
fi

# 下载并解压 AdGuard Home
wget -qO- $AGH_CORE | tar xOvz > files/usr/bin/AdGuardHome/AdGuardHome && chmod +x files/usr/bin/AdGuardHome/AdGuardHome