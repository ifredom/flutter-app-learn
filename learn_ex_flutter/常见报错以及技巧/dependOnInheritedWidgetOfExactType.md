# [dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html)

> [升级到flutter1.22](https://flutter.dev/docs/release/breaking-changes/1-22-deprecations)后  context.inheritFromWidgetOfExactType() 方法被销毁了，更换了新方法.

```dart
原：context.inheritFromWidgetOfExactType(ThemeSwitcher)
改为：context.dependOnInheritedWidgetOfExactType(aspect: ThemeSwitcher)


final type = _typeOf<InheritedProvider<T>>();
原：context.ancestorInheritedElementForWidgetOfExactType(type)?.widget
改为：context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>().widget
```

## inheritFromWidgetOfExactType 方法

> 获取给定 type 的最近小部件T(widget)，该元素T必须是具体的InheritedWidget子类的类型。从当前widget开始向父级查找。
> 
## getElementForInheritedWidgetOfExactType  方法

> 获取与给定 type 的最近小部件对应的元素(element)，该元素T必须是具体的InheritedWidget子类的类型。