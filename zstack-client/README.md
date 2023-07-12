# 项目介绍

硬件端：CC2530 实验箱，包括温湿度、红外对射、蜂鸣器等模块或传感器模块。模块之间通过 Zigbee 连接，并互相通信。

软件端：

- n 个客户端：与硬件端相连，并实时读取实验箱的串口数据。将所收集到的数据保存到 mysql 数据库中、推送到 emqx
  服务器上，实现与其他客户端、远程设备、web 管理端的数据流动。
- n 个远程设备：远程设备是通过 mqttfx 软件模拟，可以给客户端下达指令，指令通过 emqx 服务器转达。客户端得到数据之后，通过串口写入实验箱，实验箱再做一些控制。
- n 个 web 管理端：主要是获取 mysql 数据库的数据，方便查看，并做一些数据管理。同时兼备远程设备下达指令的功能。

## 使用的库

客户端通过 python 实现，使用 pyserial 模块、paho.mqtt 模块、pymysql 模块等。

远程设备：一个 mqttfx 软件。

web 管理端：基于 vite+vue+element-plus 实现。

## 目录介绍

- zstack-client：python 客户端，处理串口数据、操作数据库、与 emqx 通信。
- zstack-prj-sample-intCtrl：实验箱硬件代码。
- zstack-serve：java 服务器，面向于 web，操作数据库提供接口。
- zstack-web：vue3 项目，向 emqx 通信，渲染数据库数据。
- database：数据库 sql 文件。

# 项目声明

2022-2023-2 学期《智能物联网》课程期末项目。

GitHub：https://github.com/Himmelbleu/zstack-app
Gitee：https://gitee.com/Himmelbleu/zstack-app
