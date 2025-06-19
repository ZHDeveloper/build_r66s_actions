#!/bin/bash
# =================================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# =================================================================

# 执行预设脚本
SCRIPT_DIR="$(dirname "$0")"

# 执行 AdGuard Home 预设
if [ -f "$SCRIPT_DIR/preset-adguard-core.sh" ]; then
    chmod +x "$SCRIPT_DIR/preset-adguard-core.sh"
    bash "$SCRIPT_DIR/preset-adguard-core.sh"
fi

# 执行 OpenClash 预设
if [ -f "$SCRIPT_DIR/preset-clash-core.sh" ]; then
    chmod +x "$SCRIPT_DIR/preset-clash-core.sh"
    bash "$SCRIPT_DIR/preset-clash-core.sh"
fi