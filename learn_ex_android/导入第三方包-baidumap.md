# 报错

报错

## 查看app的SHA1

sha1值由签名文件决定，
keytool -list -v -keystore ifredom.keystore
默认的debug签名文件位于：
C:\Users\myusername \.android

## ndk 配置

1. 系统环境变量 path 设置为：
   `D:\AndroidSdk\ndk-bundle`
2. file--project structure -SDK Location --> Android NDK Locations

## Android Stuiod 中的 Add As Library 功能

Add As Library 其实就是编辑器自动给你添加目录变量，并且将 jar 包添加到依赖项 dependencies 中.这一步可以纯手动.

> `android/app`下新建文件夹 `libs`，并将下载的百度 jar 包解压缩后放置在此目录下
> 在 build.gradle 文件，在 dependences 标签中添加对应的依赖包

```bash
android {
  ...
  sourceSets {
      main {
          jniLibs.srcDir 'libs'
      }
  }
  ...
}


dependencies {
    ...

    implementation files('libs/BaiduLBS_Android.jar')

    ...
}

```

## 在`AndroidManifest.xml`中添加定位权限

> 复制粘贴

```xml
<!-- 这个权限用于进行网络定位-->
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"></uses-permission>
<!-- 这个权限用于访问GPS定位-->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"></uses-permission>
<!-- 这个权限用于获取wifi的获取权限，wifi信息会用来进行网络定位-->
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE"></uses-permission>
<!-- 访问网络，进行地图相关业务数据请求，包括地图数据，路线规划，POI检索等 -->
<uses-permission android:name="android.permission.INTERNET" />
<!-- 获取网络状态，根据网络状态切换进行数据请求网络转换 -->
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<!-- 读取外置存储。如果开发者使用了so动态加载功能并且把so文件放在了外置存储区域，则需要申请该权限，否则不需要 -->
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<!-- 读取系统信息，包含系统版本等信息，用作统计-->
<uses-permission android:name="com.android.launcher.permission.READ_SETTINGS" />
<!-- 程序在手机屏幕关闭后后台进程仍然运行-->
<uses-permission android:name="android.permission.WAKE_LOCK" />


<application android:name="io.flutter.app.FlutterApplication" android:label="first_flutter_app" android:icon="@mipmap/ic_launcher">
  <!-- 百度地图Key -->
  <meta-data android:name="com.baidu.lbsapi.API_KEY" android:value="自己去百度官网申请的免费Key放在这里" />
</application>
```


## 申请百度key时，填写的SHA1 和包名

- SHA1
  > 使用Android Studio打开项目,进入Flutter项目中的android文件夹内，打开任意一个文件.
  > 比如进入 build.gradle，右上角会有 Open for Editing an Android Studio
  > 打开之后，点击右侧 Gradle>android>app>Tasks>android>signingReport
  > 此时在控制台会出现需要SHA1值

- 包名: `AndroidManifest.xml`的`package`属性定义

修改了`AndroidManifest.xml`文件中的applacation name : 原值为:`io.flutter.app.FlutterApplication`
