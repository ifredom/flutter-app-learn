# 容器类组件

容器类组件通常只是包装单个子组件，对子组件的背景颜色，尺寸进行装饰

## Padding Widget

* fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
* all(double value) : 所有方向均使用相同数值的填充。
*bonly({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
* symmetric({ vertical, horizontal })：用于设置对称方向的填充，&vertical指top和bottom，horizontal指left和right。

## ConstrainedBox Widget

```dash
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: double.infinity, //宽度尽可能大
    minHeight: 50.0 //最小高度为50像素
  ),
  child: Container(
      height: 5.0, 
      child: redBox 
  ),
)
```

其中 `BoxConstraints`的基本参数为：

```dash
const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})
```

## DecoratedBox Widget

DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等。

```dash
const DecoratedBox({
  Decoration decoration,
  DecorationPosition position = DecorationPosition.background,
  Widget child
})
```

例子，一个带阴影的渐变色背景按钮：

```dash
 DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
      borderRadius: BorderRadius.circular(3.0), //3像素圆角
      boxShadow: [ //阴影
        BoxShadow(
            color:Colors.black54,
            offset: Offset(2.0,2.0),
            blurRadius: 4.0
        )
      ]
    ),
  child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
    child: Text("Login", style: TextStyle(color: Colors.white),),
  )
)
```

## Transform Widget

RotatedBox 和 Transform.rotate 功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
`container.dart`中有渐变实例。

## Clip Widget

剪裁Widget ：作用

* ClipOval : 子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
* ClipRRect : 将子组件剪裁为圆角矩形
* ClipRect : 剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
