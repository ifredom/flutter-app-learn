# Flutter 插件

Flutter 使用的 Dart 语言无法直接调用 Android 系统提供的 Java 接口，这时就需要使用插件来实现中转。Flutter 官方提供了丰富的原生接口封装：

- [android_alarm_manager](https://github.com/flutter/plugins/blob/master/packages/android_alarm_manager) 访问 Android 系统的 AlertManager.

- [android_intent](https://github.com/flutter/plugins/blob/master/packages/android_intent)，构造 Android 的 Intent 对象。

- [battery](https://github.com/flutter/plugins/blob/master/packages/battery)，获取和监听系统电量变化。

- [connectivity](https://github.com/flutter/plugins/blob/master/packages/connectivity)，获取和监听系统网络连接状态。

- [device info](https://github.com/flutter/plugins/blob/master/packages/device_info)，获取设备型号等信息。

- [image_picker](https://github.com/flutter/plugins/blob/master/packages/image_picker)，从设备中选取或者拍摄照片。

- [package_info](https://github.com/flutter/plugins/blob/master/packages/package_info)，获取 App 安装包的版本等信息。

- [path_provider](https://github.com/flutter/plugins/blob/master/packages/path_provider)，获取常用文件路径。

- [quick_actions](https://github.com/flutter/plugins/blob/master/packages/quick_actions)App 图标添加快捷方式，iOS 的 eponymous concept 和 Android 的 App Shortcuts。

- [sensors](https://github.com/flutter/plugins/blob/master/packages/sensors)，访问设备的加速度和陀螺仪传感器。

- [shared_preferences](https://github.com/flutter/plugins/blob/master/packages/shared_preferences)，App KV 存储功能。

- [url_launcher](https://github.com/flutter/plugins/blob/master/packages/url_launcher)，启动 URL]()，包括打电话、发短信和浏览网页等功能。

- [video_player](https://github.com/flutter/plugins/blob/master/packages/video_player)，播放视频文件或者网络流的控件。


## 参考地址
https://tech.meituan.com/2018/08/09/waimai-flutter-practice.html