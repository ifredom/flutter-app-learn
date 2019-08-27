# flutter 渐进步骤

1. 了解 flutter 的适用范围以及安装基础运行环境（万事开头难）
2. 第一步，基础组件，类比 html 中的各种 dom 元素。
3. 第二步，布局类组件，类比 html 中的 css 各种布局方法，主要区别就是 css 是绑定在对应 widget 上的属性
4. 第三步，容器类组件，类比 html5 中各种新组合类标签
5. 第四步，滑动类组件。在html用ui+li实现列表，而flutter专门对列表这样需要滑动的地方进行了优化，所以有了专门的组件
6. 第四步，功能类组件。 flutter是一个框架，对常见的功能进行了封装。
7. 事件处理和通知。只需要知道2种通信方式即可，总线通信，父子组件桥接通信，
8. 动画。根据自己的需求，可以选择跳过
9. 自定义组件。flutter深入时在学不迟
10. http网络请求。封装成功一次，终身可以使用。
11. websocket 根据需要
12. 再次深入核心原理
13. 实践。做一个简单的app，登录，病选择几个功能区实现封装。接口数据使用豆瓣开发api接口

## debug

实时刷新，设置 vscode 得终端，通过菜单栏启动

- 按下 R 刷新
- 按下 P 出现网格
- 按下 O 切换 android 和 ios 视图

## flutter 响应式原理

flutter 是响应式框架，响应式渲染 view 得原理与 vue 类似，采用虚拟 dom 结构：

> web 中： html -> virtual Dom -> dom(最终 view)
> flutter 中： widget -> element -> renderObject(最终 view)

Element 相比于 widget 增加了上下文的信息。element 是对应 widget，在渲染树的实例化节点。

## Widget 布局

Widget 布局思路来源于 CSS

- 容器组件 Container

- decoration 装饰器，设置背景色，背景图，边框，圆角，阴影和渐变等

  - margin
  - padding
  - alignment
  - width
  - height

- Padding，Center

- Row,Column,Flex

- Wrap, Flow 流式布局

- stack， z 轴布局

### 解决困惑

> 1.为什么使用 dart 语言

Dart 语言对大部分开发者而言是很陌生的一种语言。google 为啥会选择如此'冷门'的语言来开发 flutter？主要原因如下：

1. dart 具有 jit&Aot 双重编译执行方式。这样就能利用 JIt 进行开发阶段的 hot reload 开发，提升研发效率。同时在最终 release 版本中使用 aot 将 dart 代码直接变成目标平台的指令集代码。简单高效，最大限度保障了性能。
2. dart 针对 flutter 中频繁创建销毁 Widget 的场景做了专门的 gc 优化。通过分代无锁垃圾回收器，将 gc 对性能的影响降至最低。
3. dart 语言在语法上面是类 java 的，易学易用

> 2.为什么 widget 都是 immutable？

个人认为是两个主要的点：

- 提高渲染效率
  - flutte 在页面渲染上面的核心思想是 simple is fast！将 widget 设计成 immutable，所以在数据变化时，flutter 选择重建 widget 树的方式进行数据更新。采用这样方式的好处是框架不需要关心数据影响的范围，简单高效。缺点就是对 GC 会造成压力。
- 组件描述的复用
  - 既然 widget 都是不可变的。那 widget 可以以较低成本进行复用。在一个真实的渲染树中可能存在同一个 widget 渲染树中不同节点的情况。
