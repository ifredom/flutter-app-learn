# route

https://juejin.im/post/5c8db8e8f265da2d864b889f

## 基本路由

```java

Navigator.of(context).push(PageBuidler);

Navigator.of(context).pushNamedAndRemoveUntil()

```

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

## showDialog 路由相关问题

/// https://juejin.im/entry/5cd264ff6fb9a032332b4510

https://stackoverflow.com/questions/59596634/flutter-navigator-pop-not-dismiss-showdialog-widget-according-to-specified-con

https://stackoverflow.com/questions/55548153/flutter-navigator-ofcontext-pop-vs-navigator-popcontext-difference
