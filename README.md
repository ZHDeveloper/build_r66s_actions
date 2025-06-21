# OpenWrt R66S 自动编译

> 🚀 基于 GitHub Actions 的 R66S 设备 OpenWrt 固件自动编译项目

## 📋 项目简介

本项目为 **FastRhino R66S** 设备提供多种 OpenWrt 固件的自动编译服务，支持 LEDE、ImmortalWrt 等主流源码，集成丰富的插件和优化配置。

### 🎯 主要特性

- 🔄 **多源码支持**: LEDE、ImmortalWrt
- 📦 **多打包方式**: 标准固件、Flippy 打包
- ⚡ **编译优化**: 缓存机制，编译时间从3小时优化至30-90分钟
- 🛠️ **预装内核**: Clash Meta、AdGuard Home (ARM64)
- 🌐 **丰富插件**: 网络代理、容器管理、文件服务等
- 🔧 **自动化**: 定时构建、手动触发、代码变更自动构建

## 🏗️ 构建工作流

| 工作流 | 源码 | 分支 | 构建时间 | 打包方式 | 说明 |
|--------|------|------|----------|----------|------|
| **Lede-R66S** | coolsnowwolf/lede | master | 每日 18:00 | 标准 | LEDE 官方源码 |
| **ImmortalWrt-R66S** | immortalwrt/immortalwrt | openwrt-24.10 | 每日 20:00 | 标准 | ImmortalWrt 官方源码 |
| **Flippy-R66S** | 矩阵构建 | - | 每周日 02:00 | Flippy | 同时构建两个源码的 Flippy 版本 |
| **Openwrt-R66S** | 矩阵构建 | - | 每日 10:00 | 标准 | 矩阵构建，同时编译两个版本 |

## 📦 固件信息

### 🔧 基础配置
- **设备型号**: FastRhino R66S
- **架构平台**: rockchip-armv8
- **内核版本**: Linux 6.6.y
- **默认地址**: `192.168.100.1`
- **默认密码**: `password`
- **时区设置**: Asia/Shanghai (CST-8)

### 🚀 预装内核
- **Clash Meta**: ARM64 版本，支持最新协议
- **AdGuard Home**: ARM64 版本，广告过滤
- **GeoIP/GeoSite**: 最新地理位置和网站分类数据库

### 📱 LuCI 应用

#### 🌐 网络服务
- **AdGuard Home**: 广告过滤和 DNS 服务
- **SmartDNS**: 智能 DNS 解析
- **MosDNS**: 现代化 DNS 转发器
- **DDNS-Go**: 动态域名解析

#### 🔒 代理工具
- **OpenClash**: Clash 图形化管理
- **PassWall**: 多协议代理工具
- **SSR Plus**: ShadowsocksR 客户端
- **Mihomo**: 新一代代理内核

#### 🗂️ 文件管理
- **AList**: 多存储文件列表程序
- **文件传输**: 文件上传下载工具
- **磁盘管理**: 硬盘分区和挂载管理

#### 🐳 容器服务
- **Docker 管理**: 容器可视化管理界面

#### 🛠️ 系统工具
- **TTYD**: Web 终端 (免登录)
- **CPU 频率调节**: 性能和功耗优化
- **防火墙**: 网络安全管理
- **自动重启**: 定时重启功能
- **内存释放**: 系统内存优化
- **ZeroTier**: 虚拟局域网
- **网络监控**: Netdata 系统监控

#### 🎨 主题美化
- **Argon 主题**: 现代化深色主题
- **OpenTomcat 主题**: 简洁明亮主题

## 🚀 快速开始

### 1. Fork 项目
点击右上角 `Fork` 按钮，将项目复制到你的 GitHub 账户

### 2. 启用 Actions
1. 进入你的仓库
2. 点击 `Actions` 标签页
3. 点击 `I understand my workflows, go ahead and enable them`

### 3. 手动触发构建
1. 选择需要的工作流 (如 `Lede-R66S`)
2. 点击 `Run workflow`
3. 等待编译完成 (首次约3小时，后续30-90分钟)

### 4. 下载固件
编译完成后，在 `Releases` 页面下载对应的固件文件

## ⚙️ 自定义配置

### 📝 修改配置文件
编辑 `configs/r66s.config` 文件来自定义软件包：

```bash
# 添加新的 LuCI 应用
CONFIG_PACKAGE_luci-app-example=y

# 禁用不需要的应用
CONFIG_PACKAGE_luci-app-unwanted=n
```

### 🔧 自定义脚本
编辑 `scripts/diy-scripts.sh` 来添加自定义配置：

```bash
# 修改默认 IP 地址
sed -i 's/192.168.100.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 添加自定义软件包
git clone https://github.com/example/package package/example
```

### 🎯 内核配置
项目支持自动下载预设内核：
- 修改 `KERNEL` 环境变量来更改架构 (默认: arm64)
- 内核文件会自动下载到对应目录

## 📊 编译优化

### ⚡ 性能提升
- **工具链缓存**: 40-50% 时间节省
- **ccache 编译缓存**: 70-80% 时间节省
- **并行优化**: 15-20% 时间节省
- **总体效果**: 最高 80% 时间节省

### 🔄 缓存机制
- **首次构建**: ~3 小时 (建立缓存)
- **增量构建**: 30-90 分钟 (利用缓存)
- **缓存有效期**: 7 天自动清理

## 📁 项目结构

```
openwrt_r66s/
├── .github/workflows/          # GitHub Actions 工作流
│   ├── Lede-R66S.yml          # LEDE 构建
│   ├── ImmortalWrt-R66S.yml    # ImmortalWrt 构建
│   ├── Flippy-R66S.yml         # Flippy 打包构建
│   └── Openwrt-R66S.yml        # 矩阵构建
├── configs/                    # 配置文件
│   └── r66s.config            # R66S 设备配置
├── scripts/                    # 自定义脚本
│   ├── diy-scripts.sh         # 主要自定义脚本
│   ├── preset-clash-core.sh   # Clash 内核预设
│   └── preset-adguard-core.sh # AdGuard 内核预设
├── files/                      # 自定义文件 (可选)
│   └── etc/                   # 系统配置文件
├── LICENSE                     # 开源协议
└── README.md                   # 项目说明
```

## 🔧 使用说明

### 💾 固件刷写

#### 标准固件
1. 下载对应的 `.img` 文件
2. 使用 balenaEtcher 或 dd 命令写入 TF 卡
3. 插入 R66S 设备启动

#### Flippy 固件
1. 下载 Flippy 打包的固件
2. 解压后获得 `.img` 文件
3. 按照 Flippy 方法刷写到 eMMC

### 🌐 首次配置
1. 连接设备到路由器或直连电脑
2. 浏览器访问 `http://192.168.100.1`
3. 用户名: `root`，密码: `password`
4. 根据需要配置网络和插件

### 🔄 更新固件
1. 备份当前配置 (系统 → 备份/升级)
2. 下载最新固件
3. 在管理界面上传新固件
4. 选择保留配置升级

## 🛠️ 故障排除

### ❓ 常见问题

**Q: 编译失败怎么办？**
A: 检查 Actions 日志，常见原因：
- 网络问题导致下载失败
- 配置冲突
- 源码更新导致的兼容性问题

**Q: 如何添加新的软件包？**
A: 编辑 `configs/r66s.config`，添加对应的 `CONFIG_PACKAGE_xxx=y`

**Q: 固件太大无法刷入？**
A: 减少不必要的软件包，或增加分区大小配置

**Q: 如何清理编译缓存？**
A: 在仓库的 Actions 页面，点击 "Caches" 标签页删除缓存

### 🔍 调试模式
如需调试编译过程：
1. 在工作流中设置 `ssh: true`
2. 通过 SSH 连接到 Actions 环境
3. 手动执行编译命令

## 🤝 贡献指南

### 💡 如何贡献
1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

### 📋 贡献内容
- 🐛 Bug 修复
- ✨ 新功能添加
- 📚 文档改进
- 🔧 配置优化
- 🚀 性能提升

## 📄 开源协议

本项目基于 [MIT License](LICENSE) 开源协议。

## 🙏 致谢

感谢以下项目和开发者：

- **OpenWrt**: 开源路由器固件项目
- **LEDE**: Lean's OpenWrt 源码
- **ImmortalWrt**: ImmortalWrt 团队
- **P3TERX**: Actions-OpenWrt 项目启发
- **Flippy**: ARM 设备打包方案
- **unifreq**: openwrt_packit 打包工具
- **所有插件开发者**: 提供丰富的功能扩展
