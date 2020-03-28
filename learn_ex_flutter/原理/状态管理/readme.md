# 状态管理 & 路由管理

StatefulWidget 的状态应该被谁管理？Widget 本身？父 Widget？都会？还是另一个对象？答案是取决于实际情况！以下是管理状态的最常见的方法：

- Widget 管理自己的状态。(manageSelf.dart)
- Widget 管理子 Widget 状态。(parentManageChild.dart)
- 混合管理（父 Widget 和子 Widget 都管理状态）(mixinManage.dart)

## 何时适用何种`数据`管理方式

如何决定使用哪种管理方法？下面是官方给出的一些原则可以帮助你做决定：

- 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父 Widget 管理。
- 如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由 Widget 本身来管理。
- 如果某一个状态是不同 Widget 共享的则最好由它们共同的父 Widget 管理。

在 Widget 内部管理状态封装性会好一些，而在父 Widget 中管理会比较灵活。有些时候，如果不确定到底该怎么管理状态，那么推荐的首选是在父 widget 中管理（灵活会显得更重要一些）。

## 几种`路由`管理方式

核心思想：`一个轻量的路由管理本质上是页面标识（或页面路径）与页面实例的映射。`
路由分为两种：命名路由 和 构造路由

- 1.命名路由。在 MaterialApp.routes 属性上设置，使用时直接跳转到路由命名即可。缺点是无法传参

```dart
new MaterialApp(
  title: 'Flutter App',
  home: new Scaffold(
    body: Text("test"),
  ),
  routes: <String, WidgetBuilder>{
    '/home': (BuildContext context) => new HomePage(),
    '/otherOne': (BuildContext context) => new OtherOnePage(),
  },
);

// 调用方法：
// pushNamed：跳转
// pushReplacementNamed：替换
// pushNamedAndRemoveUntil: 跳到某页，并清空router堆栈，适用于退出登录。
Navigator.of(context).pushNamed('/otherRoute');
Navigator.of(context).pushReplacementNamed('/otherRoute');

Navigator.of(context).pushNamedAndRemoveUntil(
                '/otherOne', (Route<dynamic> route) => false);
```

- **这里很容易会出现一个报错，找不到 route，是因为 MaterialApp 中的 child 必须要重建 context，使用 builder 包裹一下即可**

- 2.构建路由。在需要接收参数的 widget 提前进行参数定义，并加入其构造函数中，使用时在跳转到该页面时，使用 MaterialPageRoute 构造路由，并传入参数即可。缺点相比命名路由，写起来麻烦很多。

```dart
// 跳转并发送参数
RaisedButton(
  child: Text('raiseButton'),
  onPressed: () {
    String userName = "John Doe";
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return new PageOtherOne(userName: userName);
      }),
    );
  },
)

// 将要跳转得路由,必须定义 将要接受得参数
class RecordPage extends StatefulWidget {
  final Record recordObject;

  RecordPage({Key key, @required this.recordObject}) : super(key: key);

  @override
  _RecordPageState createState() => new _RecordPageState();
}

// 使用传递过来得参数 ： widget.recordObject
class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {

   .....
   widget.recordObject
   .....
  }
}
```

[路由参考资料](https://juejin.im/post/5be2d6546fb9a049be5cf6d5)
[路由架构资料](https://segmentfault.com/a/1190000017418526)
