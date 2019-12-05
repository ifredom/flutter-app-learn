import 'package:flutter/material.dart';

class HeroAnimationB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(
          "images/image/advator.jpg",
          width: 50.0,
        ),
      ),
    );
  }
}
