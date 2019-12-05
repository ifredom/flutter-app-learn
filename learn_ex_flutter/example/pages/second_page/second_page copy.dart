import 'package:first_flutter_app/pages/second_page/stagger_animation.dart';
import 'package:flutter/material.dart';

// 下面我们看一个例子，实现一个柱状图增长的动画：

// 开始时高度从0增长到300像素，同时颜色由绿色渐变为红色；这个过程占据整个动画时间的60%。
// 高度增长到300后，开始沿X轴向右平移100像素；这个过程占用整个动画时间的40%。
class SecondPage extends StatefulWidget {
  final Widget widget;

  const SecondPage({Key key, this.widget}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          //调用我们定义的交织动画Widget
          child: StaggerAnimation(controller: _controller),
        ),
      ),
    );
  }
}
