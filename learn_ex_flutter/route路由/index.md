# route

https://juejin.im/post/5c8db8e8f265da2d864b889f

## 动态监听路由

```java

  MyNavigatorObserver myObserver = MyNavigatorObserver();

  @override
  void initState() {
    super.initState();
    //建议在initState时动态添加Observer，而不是build时，避免重复添加
    Navigator.of(context).widget.observers.add(myObserver);
  }

  @override
  void dispose() {
    super.dispose();
    //dispose时记得移除监听
    Navigator.of(context).widget.observers.remove(myObserver);
  }

```
