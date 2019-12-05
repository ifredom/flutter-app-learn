# Pages on Navigator stack rebuild when a new page is pushed [#11655]

问题描述： 页面 A -> 页面 B ->页面 c。

当我进入页面 C 时，发现 页面 A, B 都执行了 build，也就是被渲染了。如果又成千上百个组件，那这个渲染开销得多阔怕。

## `StatefulWidget` || `StatelessWidget`

所以，当你 coding 时，是选择 `StatefulWidget` 还是`StatelessWidget` ?

## 示例 demo

```java
import 'package:flutter/material.dart';
import 'package:first_flutter_app/pages/page1.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int themeColor = 0xFFC91B3A;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter App',
        theme: new ThemeData(
          primaryColor: Color(this.themeColor),
          backgroundColor: Color(0xFFEFEFEF),
          accentColor: Color(0xFF888888),
          textTheme: TextTheme(
            //设置Material的默认字体样式
            body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
          ),
          iconTheme: IconThemeData(
            color: Color(this.themeColor),
            size: 35.0,
          ),
        ),
        home: Page1(),
    );
  }
}

```

> page1.dart

```java
import 'package:flutter/material.dart';

import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print('page1 build');
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: RaisedButton(
        child: Text('下一页'),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (_) => Page2(id: 2), maintainState: true));
        },
      ),
    );
  }
}

```

> page2.dart

```java

import 'package:flutter/material.dart';

import 'page3.dart';

class Page2 extends StatefulWidget {
  // final num id;
  // Page2({Key key, this.id}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    print('page2 build');
    return Scaffold(
      appBar: AppBar(
        title: Text('纯静态，无数据传递'),
        // title: Text('${widget.id}'),
      ),
      body: RaisedButton(
        child: Text('下一页'),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (_) => new Page3(id: 2), maintainState: true));
        },
      ),
    );
  }
}

// class Page2 extends StatelessWidget {
//   final num id;
//   Page2({Key key, this.id}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print('page2 build');
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text('纯静态，无数据传递'),
//         title: Text('$id'),
//       ),
//       body: RaisedButton(
//         child: Text('下一页'),
//         onPressed: () {
//           Navigator.of(context).push(new MaterialPageRoute(
//               builder: (_) => new Page3(id: 2), maintainState: true));
//         },
//       ),
//     );
//   }
// }
```

> page3.dart

```java

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  final num id;
  Page3({Key key, this.id}) : super(key: key);
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    print('page3 build');
    return Scaffold(body: Text('${widget.id}'));
  }
}

```

### 参考资料

[参考 stack](https://stackoverflow.com/questions/52249578/how-to-deal-with-unwanted-widget-build)
