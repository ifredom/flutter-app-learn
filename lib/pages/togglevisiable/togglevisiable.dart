import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

enum VisibilityState {
  visible,
  invisible,
  offscreen,
  gone,
}

/// 更好的显示隐藏 https://www.flutter123.net/Article/Detail/49
class Visibiliable extends StatelessWidget {
  final VisibilityState visibility;
  final Widget child;
  final Widget removeChild;

  Visibiliable({
    @required this.child,
    @required this.visibility,
  }) : this.removeChild = Container();

  @override
  Widget build(BuildContext context) {
    if (visibility == VisibilityState.visible) {
      return child;
    } else if (visibility == VisibilityState.invisible) {
      return new IgnorePointer(
          ignoring: true, child: new Opacity(opacity: 0.0, child: child));
    } else if (visibility == VisibilityState.offscreen) {
      return new Offstage(offstage: true, child: child);
    } else {
      return removeChild;
    }
  }
}
