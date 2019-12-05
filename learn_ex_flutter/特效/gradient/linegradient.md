# 定义 Gradient 的两种方式

方式一：

```java
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
)
```

方式二：

```java
class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = RadialGradient(
      center: const Alignment(0.7, -0.6),
      radius: 0.2,
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)],
      stops: [0.4, 1.0],
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }
  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Sky oldDelegate) => false;
}
///调用
CustomPaint(
  size: Size(300, 300), //指定画布大小
  painter: Sky(),
);
```

## tileMode 四种植解释

tileMode: 在渐变定义的区域外，线性渐变是怎样表现得。

- TileMode.clamp (默认值) 使用`纯色`渲染渐变范围外得区域，将取 `colors`数组中最后一项的颜色作为`渲染色`。
- TileMode.mirror 使用`镜像模式`渲染渐变范围外得区域，将取 `colors`数组中的值，从第一项渐变到到最后一项，然后再继续从最后一项渐变到第一项，如此循环。
- TileMode.repeat 使用`重复模式`渲染渐变范围外得区域，将取 `colors`数组中的值，从第一项渐变到到最后一项，然后再继续从第一项渐变到最后一项，如此循环。
