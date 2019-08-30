# 基础组件

Text, Button, Image, Icon, Switch, Checkbox, TextField , Form, ProgressIndicator

## image

Flutter框架对加载过的图片是有缓存的（内存），默认最大缓存数量是1000，最大缓存空间为100M。

```dash
const Image({
  ...
  this.width, //图片的宽
  this.height, //图片高度
  this.color, //图片的混合色值
  this.colorBlendMode, //混合模式
  this.fit,//缩放模式
  this.alignment = Alignment.center, //对齐方式
  this.repeat = ImageRepeat.noRepeat, //重复方式
  ...
})

```

* width、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。

* fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

* fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。

* cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。

* contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。

* fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。

* fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。

* none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。

## icon

在Flutter开发中，iconfont和图片相比有如下优势(它本身就是如同text文本一样得字符)：

1. 体积小：可以减小安装包大小。
2. 矢量的：iconfont都是矢量图标，放大不会影响其清晰度。
3. 可以应用文本样式：可以像文本一样改变字体图标的颜色、大小对齐等。
4. 可以通过TextSpan和文本混用。

使用Material Design字体图标

Flutter默认包含了一套Material Design的字体图标，在`pubspec.yaml`文件中的配置如下

```dash
flutter:
  uses-material-design: true
```

## Switch & Checkbox

* Material 组件库中提供了Material风格的单选开关Switch和复选框Checkbox，它们都是继承自StatelessWidget，所以它们本身不会保存当前选择状态，它们的选中状态都是由父组件来管理的。
* 当Switch或Checkbox被点击时，会触发它们的onChanged回调，我们可以在此回调中处理选中状态改变逻辑。
* 局限：到目前为止，Checkbox的尺寸大小是固定的，无法自定义，而Switch只能定义宽度，高度也是固定的。
* 挺脑残的设计：CheckboxListTile, Slider 是flutter额外封装的组件，挺漂亮的，但是对于实际项目种定制的UI来说基本属于无用。为了使用flutter的这个现成组件，UI设计时需要考虑到这几个UI组件。
