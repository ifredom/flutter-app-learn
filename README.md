# first_flutter_app

A new Flutter application.

`flutter_learn_ex` 中是具体的渐进学习步骤以及对应每一个组件的练习代码.

## 开发必知

下载缓慢： https://juejin.im/post/5d8d5a105188256ec311fa99#heading-41

```bash
  # 运行.项目根目录下
  > flutter run
    # 运行.项目根目录下
  > flutter run -d [设备名称]

  // 启动，特定入口文件
  > flutter run --target lib/ui/pages/manage_dialog.dart

```

## flutter pub get无法下载

使用管理员权限启动poweshell， 在项目根目录下执行`flutter pub get`

## debug

- 按下 R 刷新
- 按下 shirt + R 强制部署
- 按下 P 出现网格
- 按下 O 切换 android 和 ios 视图

## windows 系统必知快捷键

alt + click（鼠标左键） 进入该对象查看属性
alt + left (左箭头) 后退返回的项目页
ctrl + . 鼠标悬浮于 widget ，可以自动申明变量 widget 到构造函数中

```java
class SecondPage extends StatefulWidget {
  final Widget widget; // ctrl + .
  @override
  _SecondPageState createState() => _SecondPageState();
}
```

vscode 中按下 `alt+shift+F`格式化快捷键，格式化结果可能会不够整齐，解决办法是：每一个属性末尾带上一个逗号！

## snippet 快速 coding 技巧

输入属性中得驼峰字母可以提高效率。比如我们要写一个属性: `ListTitle()`,可以输入`lt`,此时会自动给出对应提示,其中就有`ListTitle`。

## 屏幕适配方案

ScreenUtil + SizeBox

## 异常报错

> unfortunately firstapp has stopped

方式一，无效

```dash
> flutter clean
> flutter run

```

方式二，使用 `Genymotion`创建设备，并 setting->ADB-> Use custom Android SDK tools。 （设置为你得 SDK 位置即可）

### flutter for web

[flutter-for-web docs](https://flutter.dev/docs/get-started/web)

```dash
 flutter channel dev
 flutter upgrade
 flutter config --enable-web
 cd <into project directory>
 flutter create .
 flutter run -d chrome
 ```

## 创建flutter项目

注意： 不同版本下的flutter，创建出来的项目是有区别的。flutter 1.12进行了大量的不兼容性更新

//如果要指定语言，比如安卓使用java，iOS使用Swift
flutter create -i swift -a java xxapp

// 创建指定包名的项目 (https://juejin.im/post/5e804429f265da47a927de6b)

flutter create --org [包名] [项目名称，同时也是包名后缀]
flutter create --org com.ifredom myapp

## flutter创建后项目升级到1.12以后版本

https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects
