# initState 中需要 context 时？

在 initState 中，经常会执行异步操作，比如请求接口。

- 将异步操作放在一个异步方法中(checkWifi)
- 在异步方法中,如果需要用的 context 的地方，比如 dialog，比如获取屏幕尺寸，或者 provider.都需要widget build之后才会生成context.

参考：https://www.didierboelens.com/faq/week2/

```java
  _checkInitStateContext(_) async {
    showDialog(
      context: context,
      barrierDismissible: true, // 点击外区域是否关闭弹窗，可以配合超出弹窗外区域
      builder: (context) {
        return Text('123');
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_checkInitStateContext){
      /// 接口请求
    });

    // 写法二
    // Future.delayed(Duration.zero, this.fetchUserInfo);

    super.initState();
  }
```

## 注意

当您从build（BuildContext context）方法调用showDialog（）时，Flutter会找到最近的Overlay小部件，并要求它插入一个新的OverlayEntry，它将用作您要显示的对话框的容器。