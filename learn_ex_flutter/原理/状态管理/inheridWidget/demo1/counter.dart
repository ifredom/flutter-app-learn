import 'package:flutter/material.dart';

/// InheritedWidget 可以使父组件直接把数据传递给任意子组件，而不必一级一级传递
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;
  CounterProvider({Key key, this.child, this.increaseCount, this.count})
      : super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}
