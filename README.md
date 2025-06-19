# R66S OpenWrt 自动编译

[![GitHub Actions Status](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/workflows/Build%20OpenWrt/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/actions)
[![License](https://img.shields.io/github/license/YOUR_USERNAME/YOUR_REPOSITORY)](LICENSE)

本项目基于 [Lean's LEDE](https://github.com/coolsnowwolf/lede) 源码，为 [FastRhino R66S](https://www.fastrhino.com/) 设备提供自动编译的 OpenWrt 固件。

## ✨ 项目特色

- 🚀 **全自动编译**: 利用 GitHub Actions 实现每日自动编译，确保固件始终为最新版本。
- 🎯 **R66S 专属优化**: 针对 FastRhino R66S (Rockchip RK3568) 进行特别配置，充分发挥硬件性能。
- 🌐 **精选实用插件**: 集成多款常用网络工具、代理插件及美化主题，开箱即用。
- 🎨 **现代化界面**: 默认集成 `luci-theme-argon`，提供美观易用的用户界面。
- 📊 **实时系统监控**: 内置 `Netdata`，方便实时监控系统各项指标。
- 🔧 **高度可定制**: 用户可根据自身需求，通过修改配置文件轻松定制所需插件和功能。
- 📦 **预设核心组件**: 通过脚本自动下载并配置 `AdGuard Home` 和 `OpenClash` 等核心组件的最新内核。

## 📝 固件信息

- **设备型号**: FastRhino R66S
- **平台架构**: `rockchip-armv8` (Rockchip RK3568)
- **OpenWrt 源码**: [Lean's LEDE (master branch)](https://github.com/coolsnowwolf/lede)
- **默认 IP 地址**: `192.168.100.1`
- **默认用户名**: `root`
- **默认密码**: `password`
- **SSH 服务**: 默认开启，端口 `22`

## 🛠️ 主要功能与插件

<details>
<summary>点击展开/折叠详细列表</summary>

### 系统工具与增强
- **磁盘管理**: 支持磁盘分区、挂载与格式化 (`luci-app-diskman`)
- **网络监控**: `Netdata` 实时系统性能监控
- **内存释放**: `luci-app-ramfree` 定时自动释放内存
- **网页终端**: `luci-app-ttyd` 提供浏览器访问的终端
- **USB 打印服务**: `luci-app-usb-printer` 支持连接 USB 打印机
- **文件助手**: `luci-app-fileassistant` 方便管理设备文件
- **高级设置**: `luci-app-advancedsetting` 提供更多高级系统选项

### 网络功能
- **IPv6 支持**: 完整支持 IPv6 网络协议栈
- **智能 DNS**: `SmartDNS` 优化域名解析，提升上网速度
- **UPnP 支持**: `luci-app-upnp` 自动端口转发
- **DDNS 服务**: `luci-app-ddns` 支持动态域名解析
- **网络唤醒**: `luci-app-wol` 支持网络唤醒计算机
- **ZeroTier**: `luci-app-zerotier` 轻松组建虚拟局域网

### 网络安全与广告过滤
- **AdGuard Home**: `luci-app-adguardhome` (预设脚本安装)
    - 强大的网络级广告和跟踪器拦截
    - 预装最新稳定版内核
    - 管理界面默认端口: `3000`
    - DNS 服务默认端口: `5353` (避免与系统 DNS 冲突)
    - 支持 DNS-over-HTTPS (DoH) 和 DNS-over-TLS (DoT)
    - 内置优化配置及中文界面

### 代理与科学上网
- **PassWall**: `luci-app-passwall` 功能全面的代理客户端
- **OpenClash**: `luci-app-openclash` (预设脚本安装)
    - 基于 Clash Meta 内核，支持 TUN/MIXED 模式
    - 自动下载最新版 Clash Meta 内核
    - 内置 GeoIP 和 GeoSite 规则数据库
    - 支持订阅链接、自定义规则和策略组
- **ShadowSocksR Plus+**: `luci-app-ssr-plus` 经典的 SSR 代理插件
- **Hello World**: `luci-app-helloworld` (包含多种协议支持，如 V2Ray, Xray, Trojan, Hysteria 等)

### 主题与界面
- **Argon 主题**: `luci-theme-argon` (默认主题)
- **Argon 主题配置**: `luci-app-argon-config` 提供主题自定义选项

</details>

## 🚀 快速开始指南

### 1. Fork 本项目

点击本仓库页面右上角的 "Fork" 按钮，将项目复制到您自己的 GitHub 账户下。

### 2. (可选) 修改 GitHub Actions Token 权限

为了确保 GitHub Actions 能够顺利将编译好的固件上传到 Releases，您可能需要调整 Actions 的权限：

- 进入您 Fork 后的仓库，点击 "Settings" -> "Actions" -> "General"。
- 在 "Workflow permissions" 部分，选择 "Read and write permissions"。
- 点击 "Save"。

### 3. 触发编译流程

您可以通过以下任一方式触发固件编译：

- **手动触发**: 
    1. 进入您 Fork 后的仓库的 "Actions" 页面。
    2. 在左侧选择 "ImmortalWrt-R66S" 或 "Lede-R66S" 工作流 (根据您的偏好选择源码)。
    3. 点击 "Run workflow" 按钮，然后再次点击绿色的 "Run workflow" 按钮。
- **代码推送**: 当您向 `main` (或您设定的默认分支) 推送任何提交时，编译流程会自动触发。
- **定时触发**: 默认配置为每天自动编译一次 (具体时间请查看 `.github/workflows/` 下的配置文件)。

编译过程大约需要 1-2 小时，请耐心等待。

### 4. 下载编译固件

编译完成后，您可以从以下位置下载固件：

- **GitHub Releases**: 每次成功编译的固件都会自动发布到您仓库的 "Releases" 页面。这是推荐的下载方式。
- **GitHub Actions Artifacts**: 在对应工作流的运行结果页面，可以找到名为 `openwrt_firmware` (或类似名称) 的构建产物 (Artifacts)，其中包含固件文件。

固件文件名通常为 `openwrt-rockchip-armv8-fastrhino_r66s-squashfs-sysupgrade.img.gz` 或类似格式。

## 🛠️ 自定义配置

### 修改预设插件和功能

通过编辑 <mcfile name="r66s.config" path="/Users/king/Documents/openwrt_r66s/configs/r66s.config"></mcfile> 文件，您可以自由选择需要编译进固件的插件和功能。文件中的每一行对应一个 OpenWrt 的配置选项。

- **添加插件**: 将对应插件的配置项取消注释 (删除 `#`) 并设置为 `y`。
  ```diff
  -# CONFIG_PACKAGE_luci-app-example is not set
  +CONFIG_PACKAGE_luci-app-example=y
  ```
- **移除插件**: 将对应插件的配置项注释掉 (添加 `#`) 或者设置为 `is not set`。
  ```diff
  -CONFIG_PACKAGE_luci-app-example=y
  +# CONFIG_PACKAGE_luci-app-example is not set
  ```

修改完成后，提交并推送到您的 GitHub 仓库即可触发新的编译。

### 修改 DIY 脚本

本项目包含两个 DIY 脚本，用于在 OpenWrt 编译过程中执行自定义操作：

- <mcfile name="diy-part1.sh" path="/Users/king/Documents/openwrt_r66s/scripts/diy-part1.sh"></mcfile>: 在 `feeds update` 之前执行。通常用于添加自定义的 feeds 源或执行一些预处理操作。
- <mcfile name="diy-part2.sh" path="/Users/king/Documents/openwrt_r66s/scripts/diy-part2.sh"></mcfile>: 在 `feeds install` 之后，生成 `.config` 文件之前执行。通常用于修改默认配置、添加/删除软件包、打补丁等。

您可以根据需要修改这两个脚本的内容。

### 添加自定义文件

如果您有自定义的配置文件、脚本或其他文件需要包含在固件中，可以将它们放置在 <mcfolder name="files" path="/Users/king/Documents/openwrt_r66s/files/"></mcfolder> 目录下。此目录下的所有文件和目录结构将在编译时被复制到固件的根文件系统中。

例如，要添加一个自定义的 `rc.local` 启动脚本，您可以创建 <mcfile name="rc.local" path="/Users/king/Documents/openwrt_r66s/files/etc/rc.local"></mcfile>。

## ⚙️ 核心组件预设脚本

为了方便管理和更新核心组件，本项目使用预设脚本系统：

- <mcfile name="preset-adguard-core.sh" path="/Users/king/Documents/openwrt_r66s/scripts/preset-adguard-core.sh"></mcfile>: 
    - 自动从 AdGuard Home 的 GitHub Releases 下载适用于 `arm64` 架构的最新稳定版内核。
    - 集成 `luci-app-adguardhome` (通常来自第三方源，如 `sirpdboy`)，提供 LuCI 管理界面。
    - 创建必要的目录结构和默认配置文件。
- <mcfile name="preset-clash-core.sh" path="/Users/king/Documents/openwrt_r66s/scripts/preset-clash-core.sh"></mcfile>:
    - 自动下载最新版本的 Clash Meta (`mihomo`) 内核。
    - 预置 GeoIP 和 GeoSite 数据库文件。

这些脚本会在编译流程的特定阶段被调用，确保核心组件始终保持最新。

## 📄 AdGuard Home 使用简明指南

固件中预装的 AdGuard Home 默认配置如下：

1.  **访问管理界面**:
    *   通过 OpenWrt LuCI 界面: 导航至 "服务" -> "AdGuard Home"。
    *   直接访问: `http://192.168.100.1:3000` (如果端口未被修改)。
2.  **首次设置**:
    *   如果是第一次使用，访问管理界面时会引导您完成初始设置，包括设置管理员用户名和密码。
3.  **DNS 监听端口**:
    *   AdGuard Home 的 DNS 服务默认监听在 `5353` 端口，以避免与 OpenWrt 系统自身的 DNS 服务 (通常是 `dnsmasq`，监听 `53` 端口) 冲突。
    *   您需要在 DHCP 服务器设置 (通常在 "网络" -> "接口" -> "LAN" -> "DHCP 服务器" -> "高级设置" -> "DHCP-选项") 中将 DNS 服务器指向 `192.168.100.1#5353`，或者将 AdGuard Home 设置为上游 DNS 服务器。
4.  **配置文件与工作目录**:
    *   配置文件: `/etc/AdGuardHome/AdGuardHome.yaml`
    *   工作目录 (存储数据和日志): `/var/lib/AdGuardHome`
5.  **服务管理 (通过 SSH)**:
    ```bash
    /etc/init.d/adguardhome start   # 启动
    /etc/init.d/adguardhome stop    # 停止
    /etc/init.d/adguardhome restart # 重启
    /etc/init.d/adguardhome status  # 查看状态
    ```

**重要提示**:
*   首次启动 AdGuard Home 后，请务必在管理界面更新过滤规则列表。
*   建议定期检查并更新 AdGuard Home 内核版本 (如果 `luci-app-adguardhome` 支持在线更新内核) 和过滤规则，以获得最佳的广告拦截效果和安全性。

## 🚀 OpenClash 使用简明指南

固件中预装的 OpenClash 默认配置和使用建议如下：

1.  **访问管理界面**:
    *   通过 OpenWrt LuCI 界面: 导航至 "服务" -> "OpenClash"。
2.  **内核与数据库检查**:
    *   **内核**: 系统通过 <mcfile name="preset-clash-core.sh" path="/Users/king/Documents/openwrt_r66s/scripts/preset-clash-core.sh"></mcfile> 脚本预装了最新版本的 Clash Meta (`mihomo`) 内核，支持 TUN 模式等高级功能。通常无需手动下载或更新内核，除非您有特殊需求。
    *   **数据库**: GeoIP 和 GeoSite 数据库也已预置。建议在 OpenClash 配置界面定期更新这些数据库以获取最新的规则。
3.  **首次配置与订阅**:
    *   在 "全局设置" -> "常规设置" 中，检查 Clash 内核是否正确选择 (通常是 `Clash Meta`)。
    *   在 "配置文件订阅" 或 "配置文件管理" 中，添加您的 Clash 订阅链接。点击 "更新配置" 以下载或更新您的规则集。
    *   根据您的需求，在 "覆写设置" 中配置代理模式 (如 Fake-IP, TUN)、DNS 设置等。
4.  **启动与验证**:
    *   在 OpenClash 主界面启用服务并应用配置。
    *   通过 "仪表盘" 或 "日志" 查看运行状态和连接信息，确保 OpenClash 正常工作。
5.  **功能特性**:
    *   **智能分流**: 基于 GeoIP, GeoSite 和自定义规则，实现国内外流量自动分流。
    *   **策略组**: 支持手动选择节点、自动选择最优节点 (基于延迟、可用性等)、负载均衡、故障转移等多种策略。
    *   **实时监控**: 提供连接状态、流量统计、DNS 查询等实时监控信息。
    *   **规则管理**: 支持在线更新和管理订阅规则，也支持添加本地自定义规则。

**重要提示**:
*   首次启动或更新配置后，OpenClash 可能需要一些时间来加载规则和启动内核，请耐心等待。
*   如果遇到连接问题，请首先检查 OpenClash 的日志输出，通常能提供有用的错误信息。
*   TUN 模式对系统网络栈有一定要求，本固件已包含必要的内核模块和配置支持。如果 TUN 模式无法正常工作，请检查防火墙设置或尝试切换到 Fake-IP (增强) 模式。
*   定期更新您的 Clash 订阅链接和 GeoIP/GeoSite 数据库，以确保最佳的代理效果和规则准确性。

## ⚙️ 固件刷写指南

**警告: 刷机操作具有一定风险，可能导致设备无法启动。请务必在了解相关风险并做好充分准备后再进行操作。**

1.  **下载固件**: 
    *   从本项目的 GitHub Releases 页面下载最新的 `...sysupgrade.img.gz` 固件文件。
    *   解压缩 `.gz` 文件，得到 `.img` 固件镜像文件。
2.  **准备 TF 卡**: 
    *   您需要一张容量至少为 8GB 的 TF (MicroSD) 卡。
    *   建议使用高质量的 TF 卡以保证稳定性和读写速度。
3.  **写入固件到 TF 卡**: 
    *   **Windows**: 可以使用 [Rufus](https://rufus.ie/) 或 [balenaEtcher](https://www.balena.io/etcher/) 等工具将 `.img` 文件写入 TF 卡。
    *   **macOS**: 可以使用 `balenaEtcher` 或通过命令行 `dd` 工具写入。
        ```bash
        # 示例 (请将 /dev/diskX 替换为您的 TF 卡设备标识符)
        sudo diskutil unmountDisk /dev/diskX
        sudo dd if=/path/to/your/firmware.img of=/dev/rdiskX bs=1m
        ```
    *   **Linux**: 可以使用 `balenaEtcher` 或通过命令行 `dd` 工具写入。
        ```bash
        # 示例 (请将 /dev/sdX 替换为您的 TF 卡设备标识符)
        sudo umount /dev/sdX*
        sudo dd if=/path/to/your/firmware.img of=/dev/sdX bs=1M status=progress
        ```
4.  **从 TF 卡启动 R66S**: 
    *   将写入固件的 TF 卡插入 R66S 设备的 TF 卡槽。
    *   接通 R66S 电源，设备将从 TF 卡启动 OpenWrt 系统。
5.  **(可选) 将固件写入 eMMC**: 
    *   如果您的 R66S 带有 eMMC 存储，并且您希望将 OpenWrt 系统永久安装到 eMMC，可以在从 TF 卡成功启动 OpenWrt 后，通过 LuCI 界面或 SSH 执行相关脚本 (通常由 `luci-app-diskman` 或特定刷写工具提供) 将系统从 TF 卡复制到 eMMC。
    *   **注意**: 写入 eMMC 的操作风险更高，请务必谨慎，并确保您了解具体步骤。

## ⚠️ 注意事项与常见问题

-   **备份数据**: 在进行任何刷机或重大配置更改前，强烈建议备份您当前的 OpenWrt 配置。您可以通过 LuCI 界面的 "系统" -> "备份/升级" 功能进行备份。
-   **电源稳定**: 刷机过程中请确保 R66S 设备电源稳定，避免意外断电导致刷写失败。
-   **首次启动时间**: 首次从新刷写的固件启动时，系统可能需要几分钟时间进行初始化配置，请耐心等待。
-   **忘记密码/无法访问**: 如果忘记登录密码或因配置错误导致无法访问设备，您可能需要通过 TTL串口连接 或 重新刷写固件 来恢复设备。

## 🤝 技术支持与社区

-   **问题反馈**: 如果您在使用过程中遇到任何问题或发现 Bug，请在本项目的 GitHub [Issues](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/issues) 页面提交详细描述。
-   **功能建议与贡献**: 欢迎通过 [Pull Requests](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/pulls) 贡献您的代码或改进建议。
-   **讨论交流**: 您可以在本项目的 GitHub [Discussions](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/discussions) 页面与其他用户交流使用心得和技巧。

## 🙏 致谢

本项目的顺利进行离不开以下优秀的开源项目和贡献者：

-   **OpenWrt 源码**: 
    *   [Lean's LEDE OpenWrt Source](https://github.com/coolsnowwolf/lede) <mcreference link="https://github.com/coolsnowwolf/lede" index="0">0</mcreference>
    *   (如果使用 ImmortalWrt) [ImmortalWrt Project](https://github.com/immortalwrt/immortalwrt)
-   **GitHub Actions 脚本**: 
    *   [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
-   **设备支持与参考**: 
    *   [popeyema/OpenWrt-FastRhino-r68s-r66s](https://github.com/popeyema/OpenWrt-FastRhino-r68s-r66s) <mcreference link="https://github.com/popeyema/OpenWrt-FastRhino-r68s-r66s" index="0">0</mcreference>
    *   [haiibo/OpenWrt](https://github.com/haiibo/OpenWrt) <mcreference link="https://github.com/haiibo/OpenWrt" index="1">1</mcreference>
-   **LuCI 应用与主题**: 
    *   `luci-theme-argon` by [jerrykuku](https://github.com/jerrykuku/luci-theme-argon)
    *   `luci-app-adguardhome` by [sirpdboy](https://github.com/sirpdboy/luci-app-adguardhome) (或其他贡献者)
    *   `luci-app-openclash` by [vernesong](https://github.com/vernesong/OpenClash)
    *   以及其他所有被本项目包含的插件的开发者。

感谢所有为 OpenWrt 社区做出贡献的开发者和用户！

## 📜 许可证

本项目基于 [MIT License](LICENSE) 开源。请查阅 <mcfile name="LICENSE" path="/Users/king/Documents/openwrt_r66s/LICENSE"></mcfile> 文件了解详细信息。

---

**免责声明**: 本固件及相关脚本仅供个人学习和技术研究使用。用户下载、刷写和使用本固件所产生的一切后果由用户自行承担。项目作者不对因使用本固件而导致的任何直接或间接损失负责，包括但不限于设备损坏、数据丢失或网络安全问题。请在充分了解相关风险后谨慎使用。