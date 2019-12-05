# 方法

ValueChanged 可以用来定义方法。

```java

_updateMyTitle(String text) {
  setState(() {
    myTitle = text;
  });
}

。。。

class Child1Page extends StatefulWidget {
  final String title;

  final ValueChanged<String> updateMyTitle;
  //or
  //final void Function(String value) updateMyTitle;

  const Child1Page({Key key, this.title, this.updateMyTitle}) : super(key: key);

  @override
  Child1PageState createState() => Child1PageState();
}
```
