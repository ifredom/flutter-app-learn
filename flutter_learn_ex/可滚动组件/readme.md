# 可滚动组件

## SingleChildScrollView

> 通常 SingleChildScrollView 只应在期望的内容不会超过屏幕太多时使用，这是因为 SingleChildScrollView 不支持基于 Sliver 的延迟实例化模型，所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用 SingleChildScrollView 将会非常昂贵（性能差），此时应该使用一些支持 Sliver 延迟加载的可滚动组件，如 ListView

- reverse：该属性 API 文档解释是：是否按照阅读方向相反的方向滑动，如：scrollDirection 值为 Axis.horizontal，如果阅读方向是从左到右(取决于语言环境，阿拉伯语就是从右到左)。reverse 为 true 时，那么滑动方向就是从右往左。其实此属性本质上是决定可滚动组件的初始滚动位置是在“头”还是“尾”，取 false 时，初始滚动位置在“头”，反之则在“尾”，读者可以自己试验。
- primary：指是否使用 widget 树中默认的 PrimaryScrollController；当滑动方向为垂直方向（scrollDirection 值为 Axis.vertical）并且没有指定 controller 时，primary 默认为 true.

```dash
SingleChildScrollView({
  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
  this.reverse = false,
  this.padding,
  bool primary,
  this.physics,
  this.controller,
  this.child,
})
```

## List

```dash
ListView({
  ...
  // 可滚动widget公共参数
  // 滚动方向 horizontal水平，vertical 垂直
  Axis scrollDirection = Axis.vertical,
  // 滚动方向 horizontal水平，vertical 垂直
  bool reverse = false,
  // 控制器
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数
  double itemExtent,
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
```

- itemExtent：该参数如果不为 null，则会强制 children 的“长度”为 itemExtent 的值；这里的“长度”是指滚动方向上子组件的长度，也就是说如果滚动方向是垂直方向，则 itemExtent 代表子组件的高度；如果滚动方向为水平方向，则 itemExtent 就代表子组件的宽度。在 ListView 中，指定 itemExtent 比让子组件自己决定自身长度会更高效，这是因为指定 itemExtent 后，滚动系统可以提前知道列表的长度，而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
- shrinkWrap：该属性表示是否根据子组件的总长度来设置 ListView 的长度，默认值为 false 。默认情况下，ListView 的会在滚动方向尽可能多的占用空间。当 ListView 在一个无边界(滚动方向上)的容器中时，shrinkWrap 必须为 true。
- addAutomaticKeepAlives：该属性表示是否将列表项（子组件）包裹在 AutomaticKeepAlive 组件中；典型地，在一个懒加载列表中，如果将列表项包裹在 AutomaticKeepAlive 中，在该列表项滑出视口时它也不会被 GC（垃圾回收），它会使用 KeepAliveNotification 来保存其状态。如果列表项自己维护其 KeepAlive 状态，那么此参数必须置为 false。
- addRepaintBoundaries：该属性表示是否将列表项（子组件）包裹在 RepaintBoundary 组件中。当可滚动组件滚动时，将列表项包裹在 RepaintBoundary 中可以避免列表项重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加 RepaintBoundary 反而会更高效。和 addAutomaticKeepAlive 一样，如果列表项自己维护其 KeepAlive 状态，那么此参数必须置为 false
