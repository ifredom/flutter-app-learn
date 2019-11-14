# initState 中需要 context 时？

在 initState 中，经常会执行异步操作，比如请求接口。

- 将异步操作放在一个异步方法中(checkWifi)
- 在异步方法中,如果需要用的 context 的地方，比如 dialog，或者 provider.可以将

```java
  _checkInitStateContext(_) async {
    showDialog(
      context: context,
      builder: (context) {
        return Text('123');
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_checkInitStateContext);
    super.initState();
  }
```
