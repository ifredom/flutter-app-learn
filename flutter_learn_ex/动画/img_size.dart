import 'package:flutter/material.dart';
import 'package:first_flutter_app/event/myself_event_bus.dart';
import 'package:first_flutter_app/pages/transition_page/hero_B.dart';

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/image/advator.jpg"),
      builder: (BuildContext context, Widget child) {
        return new Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    // 测试事件总线
    bus.on("login", (arg) {
      print('监听到登录事件');
    });

    controller = new AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    CurvedAnimation curve = new CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    animation = new Tween(begin: 0.0, end: 200.0).animate(curve);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向）
    controller.forward();
  }

  @override
  void dispose() {
    print("销毁");
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedImage(
      animation: animation,
    );
  }
}
