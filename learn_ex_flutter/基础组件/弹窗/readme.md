# dialog 弹窗

peekoutDialog 弹窗中组件超出 dialog

addressDialog 弹窗中内嵌地址选择器

```dart
var result = await showDialog(
  context: context,
  barrierDismissible: true, 
  useRootNavigator: true, // 默认为true，表示使用根导航器。当自己创建了导航器时，设置为false，会从当前树节点就近查找，而不直接使用根导航器
  builder: (_) => MyDateDialog(),
);

if(result!=null&&result.isNotEmpty){
  // do something
}
```

- barrierDismissible: true, // 默认为true，表示点击阴影层可以关闭dialog
- useRootNavigator: true, // 默认为true，表示使用根导航器。当自己创建了导航器时，设置为false，会从当前树节点就近查找，而不直接使用根导航器

## dialog位置

dialog在widget tree中，直接挂在MateriaApp下，而不是就近的页面树节点下。

## 获取dialog返回值

- 返回值，点击阴影时返回null，所以需要对返回值进行判断
- 自定义返方法

```dart
Class MyDateDialog{
  ......

  Navigator.of(context).pop(123);

}
```
