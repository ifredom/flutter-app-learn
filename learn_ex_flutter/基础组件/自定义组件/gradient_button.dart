import 'package:flutter/material.dart';

// 组合现有组件
//**  使用方法
//           GradientButton(
//             colors: [Colors.orange, Colors.red],
//             height: 50.0,
//             child: Text("Submit"),
//             onPressed: onTap,
//           ),
// **/

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: _colors), borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: height, width: width),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
