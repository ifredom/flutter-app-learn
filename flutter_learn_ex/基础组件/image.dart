import 'package:flutter/material.dart';

class IfredomWidget extends StatelessWidget {
  const IfredomWidget({
    Key key,
    this.text: 'default text',
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  // 由于 yaml 文件对缩进严格，所以必须严格按照每一层两个空格的方式进行缩进，此处assets前面应有两个空格。
  @override
  Widget build(BuildContext context) {
    return ImageWidget();
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key key});

  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/image/advator.jpg");

    return SingleChildScrollView(
      child: Column(
        children: <Image>[
          // LocalImage(),
          // NetImage(),
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            height: 50,
            width: 50.0,
            fit: BoxFit.contain,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.fitWidth,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.fitHeight,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.scaleDown,
          ),
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.none,
          ),
          Image(
            image: img,
            width: 100.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 200.0,
            repeat: ImageRepeat.repeatY,
          )
        ].map((e) {
          return Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 100,
                  child: e,
                ),
              ),
              Text(e.fit.toString())
            ],
          );
        }).toList(),
      ),
    );
  }
}

class LocalImage extends StatelessWidget {
  const LocalImage({Key key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Image(
        image: AssetImage("images/image/advator.jpg"),
        width: 100,
        height: 40,
        fit: BoxFit.fitHeight,
        color: Colors.blue,
        colorBlendMode: BlendMode.difference,
        repeat: ImageRepeat.repeatY,
      ),
    );
  }
}

class NetImage extends StatelessWidget {
  const NetImage({Key key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage("https://profile.csdnimg.cn/B/1/7/1_win7583362"),
      width: 150.0,
    );
  }
}
