# 收藏代码

```java
// https://stackoverflow.com/questions/52022207/flutter-trouble-preserving-focus-between-routes
class CustomKeyboardPopupRoute extends TransitionRoute {
  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Iterable<OverlayEntry> createOverlayEntries() sync* {
    yield OverlayEntry(
      opaque: false,
      maintainState: true,
      builder: _buildKeyboard,
    );
  }

  Widget _buildKeyboard(BuildContext context) {
    final positionAnimation = Tween(begin: Offset(0.0, 1.0), end: Offset.zero).animate(animation);
    return SlideTransition(position: positionAnimation, child: Align(
      alignment: Alignment.bottomCenter,
      child: ...
    ),);
  }
}
```