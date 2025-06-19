# R66S OpenWrt 自动编译

基于 Lean 源码编译的 OpenWrt 固件，专为 FastRhino R66S 设备优化。

## 项目特色

- 🚀 **自动编译**: GitHub Actions 自动编译，确保获得最新固件
- 🎯 **专为 R66S 优化**: 针对 FastRhino R66S 设备的专用配置
- 🌐 **丰富插件**: 集成常用网络工具和代理插件
- 🎨 **美观界面**: 集成 Argon 主题，界面美观现代
- 📊 **系统监控**: 内置 Netdata 实时监控系统状态
- 🔧 **易于定制**: 可根据需求修改配置文件

## 固件信息

- **平台架构**: rockchip-armv8 (RK3568)
- **内核版本**: Linux 6.1
- **源码分支**: Lean's LEDE (master)
- **默认地址**: 192.168.100.1
- **默认密码**: password
- **SSH**: 默认开启

## 包含的主要功能

### 系统工具
- **磁盘管理**: 磁盘分区和管理工具
- **网络监控**: Netdata 实时系统监控
- **内存释放**: 定期释放系统内存
- **终端工具**: TTYD 网页终端
- **USB 打印**: USB 打印机支持

### 网络功能
- **IPv6 支持**: 完整的 IPv6 网络支持
- **智能 DNS**: SmartDNS 智能域名解析
- **AdGuard Home**: 网络级广告拦截和 DNS 过滤
- **ZeroTier**: 虚拟局域网组网

### 网络安全与过滤
- **AdGuard Home**: 网络级广告拦截和恶意软件防护
  - 预装最新版本内核
  - 默认端口: 3000 (管理界面)
  - DNS 端口: 5353
  - 支持 DNS-over-HTTPS 和 DNS-over-TLS
  - 内置中文界面和优化配置

### 代理工具
- **PassWall**: 功能强大的代理工具
- **OpenClash**: Clash 内核代理工具
  - 预装 Clash Meta 和 TUN 内核
  - 内置 GeoIP、GeoSite 规则数据库
  - 支持订阅链接和自定义规则
  - 完整的流量分流和策略组功能
- **SSR Plus+**: 经典的代理插件
- **多协议支持**: V2Ray、Xray、Trojan、Hysteria 等

### 主题界面
- **Argon 主题**: 现代化的 Web 界面主题
- **主题配置**: Argon 主题配置插件

## 🚀 快速开始

### 编译固件

1. **Fork 本仓库**
   ```bash
   # 克隆你的 fork
   git clone https://github.com/你的用户名/r66s_openwrt.git
   cd r66s_openwrt
   ```

2. **触发编译**
   - 推送代码到 `main` 分支
   - 或在 Actions 页面手动触发 "Build R66S OpenWrt"

3. **下载固件**
   - 编译完成后在 Actions 页面下载
   - 固件文件: `openwrt-rockchip-armv8-hinlink_opc-h66k-squashfs-sysupgrade.img.gz`

### 预设脚本系统

本项目采用统一的预设脚本管理系统，自动下载和配置各种网络工具：

- **预设脚本管理器** (`scripts/preset-manager.sh`)
  - 统一管理所有预设脚本的执行
  - 提供详细的执行日志和统计信息
  - 支持脚本执行状态监控

- **AdGuard Home 预设** (`scripts/preset-adguard-core.sh`)
- 自动下载 ARM64 架构的 AdGuard Home 内核
- 集成 sirpdboy 的 luci-app-adguardhome 管理界面（精简汉化版）
  - 创建默认配置文件和目录结构

- **OpenClash 预设** (`scripts/preset-clash-core.sh`)
  - 下载 Clash Meta 内核
  - 预置 GeoIP、GeoSite 和 Country 数据库

## 使用方法

### 1. Fork 本项目

点击右上角的 "Fork" 按钮，将项目复制到你的 GitHub 账户。

### 2. 启用 GitHub Actions

在你的仓库中，进入 "Actions" 页面，启用 GitHub Actions。

### 3. 手动触发编译

- 进入 "Actions" 页面
- 选择 "R66S OpenWrt Build" 工作流
- 点击 "Run workflow" 按钮
- 等待编译完成（约 2-3 小时）

### 4. 下载固件

编译完成后，固件将自动发布到 "Releases" 页面，下载对应的固件文件即可。

## 自定义配置

### 修改插件配置

编辑 `configs/r66s.config` 文件，添加或删除需要的插件：

```bash
# 添加插件
CONFIG_PACKAGE_luci-app-example=y

# 删除插件
# CONFIG_PACKAGE_luci-app-example is not set
```

### 修改编译脚本

- `scripts/diy-part1.sh`: 在更新 feeds 之前执行的脚本
- `scripts/diy-part2.sh`: 在更新 feeds 之后执行的脚本

### 添加自定义文件

在 `files` 目录下添加自定义文件，这些文件将被复制到固件的根文件系统中。

## 编译触发条件

- **手动触发**: 在 Actions 页面手动运行
- **定时编译**: 每天 18:00 (UTC+8) 自动编译
- **代码推送**: 当配置文件或脚本发生变化时自动编译

## 固件下载

编译完成的固件可以在以下位置下载：

1. **Releases 页面**: 最新的稳定版本
2. **Actions 页面**: 每次编译的详细日志和产物

## AdGuard Home 使用说明

固件已预装 AdGuard Home 内核和 sirpdboy 精简汉化管理界面：

1. **Web 管理界面**：
   - 访问 OpenWrt 管理界面：`http://192.168.100.1`
   - 进入「服务」→「AdGuard Home」进行配置
   - 支持端口修改和完全汉化界面

2. **首次配置**：
   - 也可直接访问 `http://192.168.100.1:3000` 进行初始设置
   - 按照向导完成基本配置
   - 设置管理员账户和密码

3. **服务管理**：
   ```bash
   # 启动服务
   /etc/init.d/adguardhome start
   
   # 停止服务
   /etc/init.d/adguardhome stop
   
   # 重启服务
   /etc/init.d/adguardhome restart
   ```

4. **配置说明**：
   - AdGuard Home 默认监听 5353 端口，避免与系统 DNS 冲突
   - 配置文件位置：`/etc/AdGuardHome/AdGuardHome.yaml`
   - 工作目录：`/var/lib/AdGuardHome`
   - 支持通过 LuCI 界面进行端口和基本配置管理

### 高级配置

- **自定义规则**: 在管理界面添加自定义过滤规则
- **白名单设置**: 为特定域名设置白名单
- **统计查看**: 查看 DNS 查询统计和拦截效果
- **安全 DNS**: 启用 DNS-over-HTTPS 提升安全性

### 注意事项

- AdGuard Home 默认监听 5353 端口，避免与系统 DNS 冲突
- 首次启动可能需要几分钟时间下载过滤规则
- 建议定期更新过滤规则以获得最佳拦截效果

## OpenClash 使用说明

### 首次配置

1. **访问管理界面**: 进入 OpenWrt 管理界面，找到 "服务" -> "OpenClash"
2. **内核检查**: 系统已预装 Clash Meta 和 TUN 内核，无需手动下载
3. **订阅配置**: 添加你的 Clash 订阅链接
4. **启动服务**: 启用 OpenClash 服务并应用配置

### 预装内容

- **Clash Meta 内核**: 最新版本的 Meta 内核，支持更多协议和 TUN 模式
- **GeoIP 数据库**: 用于 IP 地址地理位置判断
- **GeoSite 数据库**: 用于域名分类和规则匹配
- **Country.mmdb**: 国家/地区 IP 数据库

### 功能特点

- **智能分流**: 根据规则自动选择代理节点
- **策略组**: 支持负载均衡、故障转移等策略
- **实时监控**: 查看连接状态和流量统计
- **规则管理**: 自定义分流规则和黑白名单

### 注意事项

- 首次启动可能需要几分钟时间加载规则
- 建议定期更新订阅和规则数据库
- TUN 模式需要内核支持，已在固件中启用



## 刷机说明

1. 下载对应的固件文件（通常是 `.img.gz` 格式）
2. 解压得到 `.img` 文件
3. 使用 balenaEtcher 或 dd 命令将固件写入 TF 卡
4. 将 TF 卡插入 R66S 设备并启动

## 注意事项

- ⚠️ **刷机有风险**: 请确保了解刷机风险，刷机失败可能导致设备变砖
- 🔄 **备份原固件**: 刷机前建议备份原厂固件
- 📝 **配置备份**: 升级固件前请备份当前配置
- 🔌 **电源稳定**: 刷机过程中请确保电源稳定

## 技术支持

- **问题反馈**: 请在 Issues 页面提交问题
- **功能建议**: 欢迎提交 Pull Request
- **讨论交流**: 可在 Discussions 页面进行讨论

## 致谢

本项目基于以下开源项目：

- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) <mcreference link="https://github.com/coolsnowwolf/lede" index="0">0</mcreference>
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [popeyema/OpenWrt-FastRhino-r68s-r66s](https://github.com/popeyema/OpenWrt-FastRhino-r68s-r66s) <mcreference link="https://github.com/popeyema/OpenWrt-FastRhino-r68s-r66s" index="0">0</mcreference>
- [haiibo/OpenWrt](https://github.com/haiibo/OpenWrt) <mcreference link="https://github.com/haiibo/OpenWrt" index="1">1</mcreference>

## 许可证

本项目采用 MIT 许可证，详见 [LICENSE](LICENSE) 文件。

---

**免责声明**: 本固件仅供学习和研究使用，使用者需自行承担使用风险。作者不对因使用本固件造成的任何损失负责。