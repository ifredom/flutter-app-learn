# 动画

Animation 是一个抽象类，它本身和 UI 渲染没有任何关系，而它主要的功能是保存动画的插值和状态.

`Animation`有如下两个方法：

- addListener()；它可以用于给 Animation 添加帧监听器，在每一帧都会被调用。帧监听器中最常见的行为是改变状态后调用 setState()来触发 UI 重建。

- addStatusListener()；它可以给 Animation 添加“动画状态改变”监听器；动画开始、结束、正向或反向（见 AnimationStatus 定义）时会调用状态改变的监听器。

## Curve

动画过程可以是匀速的、匀加速的或者先加速后减速等。Flutter 中通过 Curve（曲线）来描述动画过程，我们把匀速动画称为线性的(Curves.linear)，而非匀速动画称为非线性的。

`CurvedAnimation` 和 `AnimationController`（下面介绍）都是 `Animation<double>`类型。CurvedAnimation 可以通过包装 AnimationController 和 Curve 生成一个新的动画对象

```java
final CurvedAnimation curve =
    new CurvedAnimation(parent: controller, curve: Curves.easeIn);
```

| Curves 曲线 | 动画过程                     |
| ----------- | ---------------------------- |
| linear      | 匀速的                       |
| decelerate  | 匀减速                       |
| ease        | 开始加速，后面减速           |
| easeIn      | 开始慢，后面快               |
| easeOut     | 开始快，后面慢               |
| easeInOut   | 开始慢，然后加速，最后再减速 |

当然我们也可以创建自己 Curve，例如我们定义一个正弦曲线：

```java
class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return math.sin(t * math.PI * 2);
  }
}
```

## AnimationController

AnimationController 用于控制动画，它包含动画的启动 forward()、停止 stop() 、反向播放 reverse()等方法。AnimationController 会在动画的每一帧，就会生成一个新的值。

例如，下面代码创建一个 Animation 对象（但不会启动动画）：

```java
final AnimationController controller = new AnimationController(
    duration: const Duration(milliseconds: 2000), vsync: this);
```

AnimationController 生成数字的区间可以通过 lowerBound 和 upperBound 来指定，如：

```java
final AnimationController controller = new AnimationController(
  duration: const Duration(milliseconds: 2000),
  lowerBound: 10.0,
  upperBound: 20.0,
  vsync: this
)
```

### AnimationController - Ticker

当创建一个 AnimationController 时，需要传递一个 vsync 参数，它接收一个 TickerProvider 类型的对象，它的主要职责是创建 Ticker，定义如下：

```java
abstract class TickerProvider {
  //通过一个回调创建一个Ticker
  Ticker createTicker(TickerCallback onTick);
}
```

Flutter 应用在启动时都会绑定一个 SchedulerBinding，通过 SchedulerBinding 可以给每一次屏幕刷新添加回调，而 Ticker 就是通过 SchedulerBinding 来添加屏幕刷新回调，这样一来，每次屏幕刷新都会调用 TickerCallback

### AnimationController - Tween

默认情况下，AnimationController 对象值的范围是[0.0，1.0]。可以自定义：

```java
final Tween doubleTween = new Tween<double>(begin: -200.0, end: 0.0);
```

Tween 继承自 `Animatable<T>`，而不是继承自 `Animation<T>`，`Animatable` 中主要定义动画值的映射规则。
下面我们看一个 ColorTween 将动画输入范围映射为两种颜色值之间过渡输出的例子：

```java
final Tween colorTween =
    new ColorTween(begin: Colors.transparent, end: Colors.black54);
```

## Tween.animate

要使用 Tween 对象，需要调用其 animate()方法，然后传入一个控制器对象。例如，以下代码在 500 毫秒内生成从 0 到 255 的整数值。

```java
final AnimationController controller = new AnimationController(
duration: const Duration(milliseconds: 500), vsync: this);
Animation<int> alpha = new IntTween(begin: 0, end: 255).animate(controller);
```

注意 animate()返回的是一个 Animation，而不是一个 Animatable。

以下示例构建了一个控制器、一条曲线和一个 Tween：

```java
final AnimationController controller = new AnimationController(
duration: const Duration(milliseconds: 500), vsync: this);
final Animation curve =
new CurvedAnimation(parent: controller, curve: Curves.easeOut);
Animation<int> alpha = new IntTween(begin: 0, end: 255).animate(curve);
```

> 注： splash_page.dart 页面中有使用到
