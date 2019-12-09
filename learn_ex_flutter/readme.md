# flutter 渐进步骤

> 如何查阅官方API，以及学会使用他们？

使用的过程中，我找到了一个vs插件: [Comment Translate](https://marketplace.visualstudio.com/items?itemName=intellsmi.comment-translate),用于翻译英文为api,努力阅读英文，遇到陌生词汇时去看中文最佳。

例如，对于 route路由  如何才能通过查询[route-api](https://api.flutter.dev/flutter/widgets/Route-class.html)，学会使用它


## 规范

- 文件命名方式，采用下划线分割，同时保持与文件中 class 驼峰式一致。例如：文件名`drawer_page.dart`，该文件中类名为： `class DrawerPage{}`

## flutter 响应式原理

flutter 是响应式框架，响应式渲染 view 得原理与 vue 类似，采用虚拟 dom 结构：

> flutter 中： widget -> element -> renderObject(最终 view)

Element 相比于 widget 增加了上下文的信息。element 是对应 widget，在渲染树的实例化节点。


> 2.为什么 widget 都是 immutable？

个人认为是两个主要的点：

- 提高渲染效率
  - flutte 在页面渲染上面的核心思想是 simple is fast！将 widget 设计成 immutable，所以在数据变化时，flutter 选择重建 widget 树的方式进行数据更新。采用这样方式的好处是框架不需要关心数据影响的范围，简单高效。缺点就是对 GC 会造成压力。
- 组件描述的复用
  - 既然 widget 都是不可变的。那 widget 可以以较低成本进行复用。在一个真实的渲染树中可能存在同一个 widget 渲染树中不同节点的情况。

## 性能优化

[PageView 缓存页面装状态](https://zhuanlan.zhihu.com/p/58582876)

## 教学视频

What is Flutter? => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h0m13s
Understanding the Flutter Architecture => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h3m12s
Flutter macOS Setup => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h6m55s
macOS Development Environment => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h25m46s
Flutter Windows Setup => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h29m54s
Windows Development Environment => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h49m10s
Flutter Alternatives => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h52m55s
Flutter & Material Design => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h56m7s
Flutter is Under Active Development! => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h57m32s
Course Outline => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=0h59m40s
How To Get The Most Out Of The Course => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h3m57s
Module Introduction => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h6m14s
Creating a New Flutter Project => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h7m29s
Exploring the Default Project Structure => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h11m47s
Diving Into the "main.dart" File => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h14m7s
Widgets in Flutter - Theory => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h16m39s
Creating a Widget => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h18m46s
Adding the "Build" Method https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h23m42s
Adding the Scaffold => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h27m48s
Diving Deeper Into the Syntax => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h34m23s
Adding Cards & Images => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h40m29s
Diving Into the Official Docs => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h47m22s
Adding a Button => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h49m19s
Creating a Stateful Widget => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h53m15s
Managing Data Inside Stateful Widgets => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=1h58m42s
Adding the Stateful Widget & Lists => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h3m54s
Splitting our Code Up => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h7m27s
Creating the "Product Manager" Widget => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h14m5s
Passing Data to Stateful Widgets => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h19m54s
Understanding Lifecycle Hooks => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h26m57s
Diving Into Google's Material Design => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h36m34s
Understanding Additional Dart Features => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h41m19s
Assignment 1: Time to Practice - Widgets & Basics - Problem => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h47m4s
Assignment 1: Time to Practice - Widgets & Basics - Solution => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=2h48m59s
Passing Data Up => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=3h1m45s
Understanding "const" & "final" => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=3h10m38s
Wrap Up => https://www.youtube.com/watch?v=GLSG_Wh_YWc&t=3h16m44s
