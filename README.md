# MT7621车载路由器

![pcb.jpg](image/pcb.jpg)

---

## 特性

兼容9-15V输入

可调低压保护(电位器设置) 电压低于设定电压约2s后关断

提供1个带低压保护的输出电源接口 带独立保险丝

支持2块MINI PCI-E无线网卡

支持3042/3052 4G/5G网卡

千兆LAN/WAN

---

## 开源协议:

GPL 3.0

---

## 项目地址:

##### 硬件:

[立创开源硬件平台](http://oshwhub.com/richard.tung/car_integrated_router)

##### 软件:

[GitHub](https://github.com/Richard-Tung/mt7621_integrated_router)

##### 扩展项目:

###### DIY车载哨兵监控:

[BiliBili](https://www.bilibili.com/video/BV1fVoTYiEk7/)

[小红书](http://xhslink.com/a/82JiEn8iPFsab)

---

## 提供如下接口:

2x MINI PCI-E:    PCIe x1信号 用于WiFi扩展 预留5V供电输入可用于带PA的网卡
1x NGFF B KEY:    PCIe x1+USB2.0信号 兼容3042/3052 用于4G/5G网卡扩展
1x NANO SIM:    4G/5G网卡的SIM卡 支持热插拔
1x USB 2.0排针:    可连接任意USB设备
1x GE WAN:    有线WAN口
2x GE LAN:    有线LAN口

---

## 配置如下传感器(I2C总线):

INA226:        电压和功率传感器 地址0x40

AHT20:        温度湿度传感器 地址0x38

注意: openwrt下需要安装对应kmod才能使用lm-sensors检测出来

---

## ACC触发检测:

支持ACC触发检测

使用BTN_0的按键检测 ACC触发(启动)状态为按下 停车状态为未按下

---

## 指示灯:

网口上橙色灯为系统下可配置的状态灯

orange:wan

orange:lan2

orange:lan2

其中 orange:wan 默认为系统状态灯

---

## 目录结构:

##### datasheet:

部分原件datasheet

##### dts:

openwrt使用的dts

根据版本将文件放入target/linux/ramips/dts下覆盖

##### lceda_project:

立创EDA的PCB工程文件

##### scripts:

OpenWRT下的脚本文件

rc.button内文件请放入/etc/rc.button

##### router_binary:

预编译的路由器固件

可直接在开发板原系统上升级 **注意升级时不要保留数据!**

---

## 编译:

目前仅兼容openwrt-24.10

将dts文件放入指定目录覆盖

Target System 选择 MediaTek Ralink MIPS

Subtarget 选择 MT7621 based boards

Target Profile 选择 HiLink HLK-7621A evaluation board

选择自己需要的软件包

进行编译
