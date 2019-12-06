# gradle 相关

gradle

## gradle.properties文件

```java
org.gradle.jvmargs=-Xmx1536M
///是否使用androidX
android.useAndroidX=true
android.enableJetifier=true
/// gradle时，循序使用兼容的NDK工具
/// 比如，有的第三方包对gradle是3.1.2,有的是4.0,那么在gradle时自动选择^4.0大于4的版本去构建
ndroid.useDeprecatedNdk=true
/// Android代码压缩工具R8
android.enableR8=true
```