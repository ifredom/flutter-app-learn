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

## ListView

```java
ListView({
  ...
  // 滚动方向, 默认是垂直方向 vertical
  Axis scrollDirection = Axis.vertical,
  // 滚动方向,是否按照阅读方向相反的方向滑动
  bool reverse = false,
  // 控制器
  // 此属性接收一个ScrollController对象，ScrollController的主要作用是控制滚动位置和监听滚动事件。
  // 默认情况下，Widget树中会有一个默认的PrimaryScrollController，如果子树中的可滚动组件没有显示的指定controller，并且primary属性值为true时，可滚动组件会使用这个默认的ScrollController。
  // 这种机制带来的好处是父组件可以控制子树中可滚动的滚动行为，例：scaffold正是使用这种机制在iOS中实现了点击导航回到顶部的功能。
  ScrollController controller,
  //是否使用widget树中默认的PrimaryScrollController
  bool primary,
  //此属性接受一个ScrollPhysics类型的对象，它决定可以滚动如何响应用户操作，比如用户滑动完抬起手指后，继续执行动画，或者滑动到边界时，如何显示。
  //默认情况下，Flutter会根据具体平台分别使用不同的ScrollPhysics对象，对应不同的显示效果，如当滑动到边界时，继续拖动的话，在iOS上会出现弹性效果，
  //而在Android上会出现微光效果。如果你想在所有平台下使用同一种效果，可以显示指定一个固定的ScrollPhysics。
  //Flutter SDK包含两个ScrollPhysics的子类。1.ClampingScrollPhysics：Android下微光效果，2.BouncingScrollPhysics：iOS下弹性效果
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

## GridView

```dash
SliverGridDelegateWithFixedCrossAxisCount({
  @required double crossAxisCount,
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
```

- crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即 ViewPort 横轴长度除以 crossAxisCount 的商。
- mainAxisSpacing：主轴方向的间距。
- crossAxisSpacing：横轴方向子元素的间距。
- childAspectRatio：子元素在横轴长度和主轴长度的比例。由于 crossAxisCount 指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。

## CustomScrollView

CustomScrollView 的子组件必须都是 Sliver

## ScrollController & ScrollPosition

`ScrollController` 用来控制可滚动组件得类，其构造函数为：

```dash
ScrollController({
  double initialScrollOffset = 0.0, // 初始滚动位置
  this.keepScrollOffset = true,// 是否保存滚动位置
  ...
})
```

`ScrollController` 常用的属性和方法：

- offset：可滚动组件当前的滚动位置。
- jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。

`ScrollPosition`有两个常用方法：
animateTo() 和 jumpTo()它们是真正来控制跳转滚动位置的方法，ScrollController 的这两个同名方法，内部最终都会调用 ScrollPosition 的。
