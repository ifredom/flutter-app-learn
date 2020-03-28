import 'package:flutter/material.dart';

List<String> images = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=dee500a3bf52ac10d347fb00e906c1ee&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F810a19d8bc3eb1354c94a704ac1ea8d3fd1f4439.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=61caf399f525d14fb315a4f01b3d7a9e&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F21a4462309f7905296a7578106f3d7ca7acbd5d0.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=dee500a3bf52ac10d347fb00e906c1ee&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F810a19d8bc3eb1354c94a704ac1ea8d3fd1f4439.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571766555583&di=a01d396cb3889f5f072e7a41c7a3f845&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11cb2d45bfb312c8fcc2ce2d91.jpg',
];

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SingleChildScrollView
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('ifredom'),
            // pinned: true, // 固定头部
            floating: true, // 头部跟随动作，向下滑时出现头部，向上时隐藏头部
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: images.length,
      ),
    );
  }
}
