import 'package:flutter/material.dart';
import 'dart:ui';

// 毛玻璃效果
class FrosFromClassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: <Widget>[
        //  约束性盒子，作用：添加额外约束条件到child上
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Image.network('http://img3.imgtn.bdimg.com/it/u=1910932285,462253340&fm=26&gp=0.jpg'),
        ),
        Center(
          child: ClipRect(// 可裁剪得组件
            child: BackdropFilter(// 背景过滤器
              filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(color:Colors.grey.shade200),
                  child: Center(
                    child: Text('ifredom',
                    style: Theme.of(context).textTheme.display3),
                  ),
                ),
              ),
            ),
          ),
        )

      ]
    ));
  }
}
