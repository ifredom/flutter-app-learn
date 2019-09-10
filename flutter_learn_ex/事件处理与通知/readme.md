# 事件

## 原始指针

- position：它是鼠标相对于当对于全局坐标的偏移。
- delta：两次指针移动事件（PointerMoveEvent）的距离。
- pressure：按压力度，如果手机屏幕支持压力传感器(如 iPhone 的 3D Touch)，此属性会更有意义，如果手机不支持，则始终为 1。
- orientation：指针移动方向，是一个角度值。
  上面只是 PointerEvent 一些常用属性，除了这些它还有很多属性，读者可以查看 API 文档。

现在，我们重点来介绍一下 behavior 属性，它决定子组件如何响应命中测试，它的值类型为 HitTestBehavior，这是一个枚举类，有三个枚举值：

- deferToChild：子组件会一个接一个的进行命中测试，如果子组件中有测试通过的，则当前组件通过，这就意味着，如果指针事件作用于子组件上时，其父级组件也肯定可以收到该事件。

- opaque：在命中测试时，将当前组件当成不透明处理(即使本身是透明的)，最终的效果相当于当前 Widget 的整个区域都是点击区域。举个例子：

```java
Listener(
    child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(300.0, 150.0)),
        child: Center(child: Text("Box A")),
    ),
    //behavior: HitTestBehavior.opaque,
    onPointerDown: (event) => print("down A")
)
```

- translucent：当点击组件透明区域时，可以对自身边界内及底部可视区域都进行命中测试，这意味着点击顶部组件透明区域时，顶部组件和底部组件都可以接收到事件
