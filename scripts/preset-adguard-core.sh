#!/bin/bash

# 创建目录结构
mkdir -p files/usr/bin

# 下载 AdGuardHome 核心文件
AGH_CORE=$(curl -sL https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest | grep /AdGuardHome_linux_${1} | awk -F '"' '{print $4}')

# 直接下载到 /usr/bin/AdGuardHome 文件（不是目录）
wget -qO- $AGH_CORE | tar xOvz > files/usr/bin/AdGuardHome
chmod +x files/usr/bin/AdGuardHome
