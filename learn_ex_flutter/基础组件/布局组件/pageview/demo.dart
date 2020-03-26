import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  // 页面控制器初始化
  double _currentPage = 0.0;
  PageController _pageController = PageController(initialPage: 0);

  _tap() {
    // 点击下面tabbar的时候执行 pageView 动画跳转方法
    // _pageController.animateToPage(index, duration: new Duration(milliseconds: 500),curve:new ElasticOutCurve(4));
  }
  @override
  Widget build(BuildContext context) {
    return _buildPageView(context);
  }

  Widget _buildPageView(BuildContext context) {
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    double _statusBarHeight2 = MediaQuery.of(context).padding.bottom;
    print("_statusBarHeight:$_statusBarHeight");
    print("_statusBarHeight2:$_statusBarHeight2");

    return Container(
      height: MediaQuery.of(context).size.height - 135,
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) => NotificationListener(
          onNotification: (ScrollNotification note) {
            setState(() {
              _currentPage = _pageController.page;
            });
            return false;
          },
          child: _buildPageViewContent(constraints),
        ),
      ),
    );
  }

  Widget _buildPageViewContent(BoxConstraints constraints) {
    return PageView.custom(
      physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
      controller: _pageController,
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _SimplePage(
          '$index',
          parallaxOffset: constraints.maxWidth / 2.0 * (index - _currentPage),
          // 小字 Text 在页面滑动时要比整体移动速度快一倍，所以小字的 translate X 为 \tt{pageWidth / 2 * progress} 。
        ),
        childCount: 10,
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  _SimplePage(this.data, {Key key, this.parallaxOffset = 0.0})
      : super(key: key);

  final String data;
  final double parallaxOffset;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  data,
                  style: const TextStyle(fontSize: 60.0, color: Colors.black),
                ),
                SizedBox(height: 40.0),
                Transform(
                  transform:
                      Matrix4.translationValues(parallaxOffset, 0.0, 0.0),
                  child: const Text(
                    '左右滑动，这是第二行滚动速度更快的小字',
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
